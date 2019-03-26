testing_hk_odds <- c(1.9,NA,0.1,-0.23,2.5,1.1,3000)

expected_us_odds_from_hk <- c(190,
                                   NA,
                                   -1000,
                                   NA,
                                   250,
                                   110,
                                   300000)

expected_prob_from_hk <- c(0.3448275862,
                                NA,
                           0.9090909091,
                                NA,
                           0.2857142857,
                           0.4761904762,
                           0.0003332223)

expected_decimal_from_hk <- c(2.9,
                              NA,
                              1.1,
                              NA,
                              3.5,
                              2.1,
                              3001)

expected_indo_from_hk <- c(1.9,
                                NA,
                                -10,
                                NA,
                                2.5,
                                1.1,
                                3000)


expected_malay_from_hk <- c(-0.5263157895,
                                 NA,
                            0.1000000000,
                                 NA,
                                 -0.4000000000,
                            -0.9090909091,
                                 -0.0003333333)


expect_equal(expected_us_odds_from_hk,
             odds.hk2us(testing_hk_odds))

expect_equal(expected_prob_from_hk,
             odds.hk2prob(testing_hk_odds))

expect_equal(expected_decimal_from_hk,
             odds.hk2dec(testing_hk_odds))

expect_equal(expected_indo_from_hk,
             odds.hk2indo(testing_hk_odds))

expect_equal(expected_malay_from_hk,
             odds.hk2malay(testing_hk_odds))