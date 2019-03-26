context("Entropy Calculation")

library("RcppTN")

test_that("Analytic \approx Simulation",
      {
          lows <- c(-1, 5, -100, 4, 4, -100, 7)
          highs <- c(1, 100, 10, 7, 4.1, 100, 100)
          T <- 100000
          for(case in 1:length(lows)) {
              out1 <- enttn(.mean = 0,
                            .sd = 1,
                            .low = lows[case],
                            .high = highs[case]
                            )
              out2 <- rtn(.mean = rep(0, T),
                          .sd = rep(1, T),
                          .low = rep(lows[case], T),
                          .high = rep(highs[case], T)
                          )
              out3 <- -log(dtn(out2,
                               .mean = rep(0, T),
                               .sd = rep(1, T),
                               .low = rep(lows[case], T),
                               .high = rep(highs[case], T)
                               )
                           )
              muhat <- mean(out3)
              sigmahat <- sd(out3)
              cilow <- muhat - 1.96 * sigmahat
              cihigh <- muhat + 1.96 * sigmahat
              expect_true(out1 > cilow & out1 < cihigh)
          }
      }
          )


test_that("Infinite bounds work.",
      {
          q1 <- enttn(.mean = c(0, 0),
                      .sd = c(1, 1),
                      .low = c(-1000, -Inf),
                      .high = c(0, 0)
                      )
          expect_true(identical(q1[1], q1[2]))

          q2 <- enttn(.mean = c(0, 0),
                      .sd = c(1, 1),
                      .high = c(1000, Inf),
                      .low = c(0, 0)
                      )
          expect_true(identical(q2[1], q2[2]))
      }
          )
