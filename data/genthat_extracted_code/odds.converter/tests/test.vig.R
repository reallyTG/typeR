us <- c(-110, -120, -110, -100)
probs <- c(11/21, 6/11, 11/21, 1/2)
vigs <- c(1/22, 1/23)

# US input
expect_equal(odds.vig(us[1], us[3]), vigs[1])
expect_equal(odds.vig(us[c(1, 3)]), vigs[1])
expect_equal(odds.vig(us[c(1, 3, NA)]), NA_real_)
expect_equal(odds.vig(home = us[c(1:2, NA)],
                      away = us[c(3:4, NA)]),
             c(vigs, NA_real_))
expect_equal(odds.vig(matrix(c(us[1:2], NA, us[3:4], NA), ncol = 2,
                             dimnames = list(paste0("gm", 1:3), c("h", "a")))),
             c(gm1 = vigs[1], gm2 = vigs[2], gm3 = NA_real_))
expect_equal(odds.vig(data.frame(home = us[c(1:2, NA)],
                                 away = us[c(3:4, NA)])),
             c(vigs, NA_real_))

# Probability input
expect_equal(odds.vig(probs[1], probs[3], input = "prob"), vigs[1])
expect_equal(odds.vig(probs[c(1, 3)], input = "prob"), vigs[1])
expect_equal(odds.vig(probs[c(1, 3, NA)]), NA_real_)
expect_equal(odds.vig(home = probs[c(1:2, NA)],
                      away = probs[c(3:4, NA)], input = "prob"),
             c(vigs, NA_real_))
expect_equal(odds.vig(matrix(probs[c(1:2, NA, 3:4, NA)], ncol = 2,
                             dimnames = list(paste0('gm', 1:3), c('h', 'a'))),
                      input = "prob"),
             c(gm1 = vigs[1], gm2 = vigs[2], gm3 = NA_real_))
expect_equal(odds.vig(data.frame(home = probs[c(1:2, NA)],
                                 away = probs[c(3:4, NA)]), input = "prob"),
             c(vigs, NA_real_))
