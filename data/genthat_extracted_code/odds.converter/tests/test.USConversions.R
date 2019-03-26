us_odds <- c(-111,NA,99,103,-27,203)

expected_decimal_from_us_odds <- c(1.900901,
                                   NA,
                                   NA,
                                   2.030000,
                                   NA,
                                   3.030000)

expected_prob_from_us_odds <- c(0.5260664,
                                NA,
                                NA,
                                0.4926108,
                                NA,
                                0.3300330)

expected_malay_from_us_odds <- c(0.9009009,
                              NA,
                              NA,
                              -0.9708738,
                              NA,
                              -0.4926108
                              )

expected_indo_from_us_odds <- c(-1.11,
                                NA,
                                NA,
                                1.03,
                                NA,
                                2.03)


expected_hk_from_us_odds <- c(0.9009009,
                                 NA,
                                 NA,
                              1.0300000,
                                 NA,
                              2.0300000)


expect_equal(expected_prob_from_us_odds,
             odds.us2prob(us_odds),
             tolerance = 1e-06)

expect_equal(expected_decimal_from_us_odds,
             odds.us2dec(us_odds),
             tolerance = 1e-06)

expect_equal(expected_indo_from_us_odds,
             odds.us2indo(us_odds),
             tolerance = 1e-06)

expect_equal(expected_malay_from_us_odds,
             odds.us2malay(us_odds),
             tolerance = 1e-06)

expect_equal(expected_hk_from_us_odds,
             odds.us2hk(us_odds),
             tolerance = 1e-06)
