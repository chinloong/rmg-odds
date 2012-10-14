package OddsConverter;

use POSIX;

=head1 NAME

OddsConverter

=head1 SYNOPSIS

my $oc = OddsConverter->new(probability => 0.5);
print $oc->decimal_odds; # '2.00' (always to 2 decimal places)
print $oc->roi; # '100%' (always whole numbers or 'Inf.')

=cut

#############################################
##Object constructor (simplistic version)  ##
#############################################
sub new {
    my $myclass = shift;
    my %input = @_;
    my $self  = {};
    $self->{PROBABILITY}   = $input{probability};
    bless($self);           # but see below
    return $self;
}
    ##############################################
    ## methods to access per-object data        ##
    ##                                          ##
    ## With args, they set the value.  Without  ##
    ## any, they only retrieve it/them.         ##
    ##############################################
    sub decimal_odds {
        my $self = shift;
        my $decimal_odds = 1 + $self->{PROBABILITY};
        $decimal_odds = sprintf("%.2f",$decimal_odds);
        return $decimal_odds;
    }
    sub roi {
        my $self = shift;
        my $roi = 100*$self->{PROBABILITY};
        $roi = floor($roi);

        return $roi."%";
    }


1;