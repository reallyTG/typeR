testing_decimal_odds <- c(1.9,NA,0.1,-0.23,2.5,1.1,3000)

expected_us_odds_from_decimal <- c(-111.11111,
                                   NA,
                                   NA,
                                   NA,
                                   150,
                                   -1000,
                                   299900)

expected_prob_from_decimal <- c(0.5263157895,
                                   NA,
                                   NA,
                                   NA,
                                   0.4,
                                0.9090909091,
                                0.0003333333)

expected_hk_from_decimal <- c(0.9,
                                NA,
                                NA,
                                NA,
                                1.5,
                                0.1,
                                2999)

expected_indo_from_decimal <- c(-1.111111,
                                NA,
                                NA,
                                NA,
                                1.5,
                                -10,
                                2999)


expected_malay_from_decimal <- c(0.9,
                                NA,
                                NA,
                                NA,
                                -0.6666666667,
                                0.1,
                                -0.0003334445)


expect_equal(expected_us_odds_from_decimal,
                 odds.dec2us(testing_decimal_odds))

expect_equal(expected_prob_from_decimal,
             odds.dec2prob(testing_decimal_odds))

expect_equal(expected_hk_from_decimal,
             odds.dec2hk(testing_decimal_odds))

expect_equal(expected_indo_from_decimal,
             odds.dec2indo(testing_decimal_odds))

expect_equal(expected_malay_from_decimal,
             odds.dec2malay(testing_decimal_odds))