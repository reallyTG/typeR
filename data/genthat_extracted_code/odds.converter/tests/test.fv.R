us <- c(-110, -120, -110, -100)
fair_ps <- c(1/2, 12/23, 1/2, 11/23)

expect_equal(odds.fv(us[1], us[3], output = "prob"), c(fair_ps[1], fair_ps[3])) # old had generated names
expect_equal(odds.fv(us[c(1, 3)], output = "prob"), c(fair_ps[1], fair_ps[3]))
expect_equal(odds.fv(us[c(1, NA)], output = "prob"), rep(NA_real_, 2)) # old was single NA
expect_equal(odds.fv(home = us[c(1:2, NA)],
                      away = us[c(3:4, NA)], output = "prob"),
             matrix(fair_ps[c(1:2, NA, 3:4, NA)], ncol = 2,
                    dimnames = list(NULL, c("home", "away"))))
expect_equal(odds.fv(matrix(c(us[1:2], NA, us[3:4], NA), ncol = 2,
                         dimnames = list(paste0("gm", 1:3), c("h", "a"))),
                  output = "prob"),
             matrix(fair_ps[c(1:2, NA, 3:4, NA)], ncol = 2,
                    dimnames = list(paste0("gm", 1:3), c("h", "a")))) # old stripped row names
expect_equal(odds.fv(data.frame(home = us[c(1:2, NA)],
                             away = us[c(3:4, NA)]), output = "prob"),
             matrix(fair_ps[c(1:2, NA, 3:4, NA)], ncol = 2,
                    dimnames = list(NULL, c("home", "away"))))
