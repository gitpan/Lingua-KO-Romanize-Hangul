# ----------------------------------------------------------------
    use strict;
    use Test::More tests => 7;
    BEGIN { use_ok('Lingua::KO::Romanize::Hangul'); };
# ----------------------------------------------------------------
{
    my $roman = Lingua::KO::Romanize::Hangul->new();
    ok( ref $roman, "new" );

    ok( (! defined $roman->char("a")), "ascii" );
    is( $roman->char("\xEA\xB0\x80"), "ga", "AC00 = EAB080 = ga" );
    is( $roman->char("\xED\x9E\xA3"), "hih", "D7A3 = ED9EA3 = hih" );

    my @list = $roman->string("\xED\x95\x9C\xEA\xB8\x80");
    is( $list[0]->[1], "han", "han" );
    is( $list[1]->[1], "geur", "geur" );
}
# ----------------------------------------------------------------
;1;
# ----------------------------------------------------------------
