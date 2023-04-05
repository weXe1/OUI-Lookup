#!/usr/bin/perl
use strict;
use warnings;

open(my $fh, `echo -n \$OUIFILE`) or die "ERROR: $!\n";

die "usage:\n\$ perl $0 <oui>\n\n" unless @ARGV;

my $oui = $ARGV[0];

die "Incorrect OUI format\n" unless $oui =~ /^[0-9a-f]{2}:[0-9a-f]{2}:[0-9a-f]{2}$/i;

while (<$fh>) {
    if ($_ =~ /^$oui\|(.+)/i) {
        print "$1\n";
        last;
    }
}

