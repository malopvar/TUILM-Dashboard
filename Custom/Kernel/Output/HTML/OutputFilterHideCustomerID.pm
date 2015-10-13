# --
# Kernel/Output/HTML/OutputFilterHideCustomerID.pm
# Copyright (C) 2015 Perl-Services.de, http://www.perl-services.de/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::OutputFilterHideCustomerID;

use strict;
use warnings;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;
    
    my $Templatename = $Param{TemplateFile} || '';
    
    return 1 if !$Templatename;
    return 1 if !$Param{Templates}->{$Templatename};
    
    ${ $Param{Data} } =~ s{
        <label>\[\% \s+ Translate\("CustomerID
        .*?
        <div \s+ class="Clear"></div>
    }{
    }xsm;

    return ${ $Param{Data} };
}

1;