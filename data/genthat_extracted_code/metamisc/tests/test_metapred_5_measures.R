context("metapred 5. Performance and heterogeneity measures.")

### To Do:
# Add more performance measures
# Add more tests for REMA
# Add more tests for Heterogeneity measures.

f <- dvt ~ histdvt + ddimdich

############################ Performance Measures ##########################################
test_that("metapred can estimate variances of performance measures", {  
  data(DVTipd)
  DVTipd$cluster <- letters[1:4]
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f) # mse
  expect_false((anyNA(mp$stepwise$s0$cv$unchanged$cv.dev[["perf"]])))
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f, perfFUN = "auc")
  expect_false((anyNA(mp$stepwise$s0$cv$unchanged$cv.dev[["perf"]])))
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f, perfFUN = "calibration.slope")
  expect_false((anyNA(mp$stepwise$s0$cv$unchanged$cv.dev[["perf"]])))
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f, perfFUN = "calibration.intercept")
  expect_false((anyNA(mp$stepwise$s0$cv$unchanged$cv.dev[["perf"]])))
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f, perfFUN = "var.e")
  expect_false((anyNA(mp$stepwise$s0$cv$unchanged$cv.dev[["perf"]])))
})


# test_that("metapred use even more performance measures", {  
#   # To be added
# })

############################ Heterogeneity Measures ##########################################
test_that("metapred can use different Heterogeneity measures", {  
  data(DVTipd)
  DVTipd$cluster <- letters[1:4]
  mp.fema <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 genFUN = "fema") # Fixed Effects Meta-Analysis
  
  mp.rema <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 genFUN = "rema.beta") # Random Effects Meta-Analysis estimate of performance
  
  expect_equal(subset(mp.fema, "global")$gen, subset(mp.rema, "global")$gen) # there is no
    # heterogeneity, so fema = rema.
  
  mp.tau <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 genFUN = "rema.tau") # Random Effects Meta-Analysis estimate of 
                                          # heterogeneity of performance 
  expect_equal(subset(mp.tau, "global")$gen, 0) # there is no heterogeneity, so tau2 = 0
  
})

### Combinations of performance + heterogeneity measures
test_that("metapred can use rema with different perf measures.", {
  data(DVTipd)
  DVTipd$cluster <- letters[1:4]
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 perfFUN = "auc", genFUN = list(rema = "rema.beta"))
  expect_true(mp$stepwise$s0$cv$unchanged$gen > 0)
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 perfFUN = "calibration.slope", genFUN = "rema.tau")
  expect_true(mp$stepwise$s0$cv$unchanged$gen == 0)
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 perfFUN = "calibration.intercept", genFUN = list(tau = "rema.beta"))
  
  mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
                 perfFUN = "auc", genFUN = list(tau = "rema.beta", plot = "forest.perf"))
  
  # valmeta does not produce tau!
  # so rema.tau cannot be used on auc!
  # mp <- metapred(DVTipd, strata = "cluster", formula = f, family = binomial, scope = f,
  #                perfFUN = "auc", genFUN = list(tau = "rema.tau"))
})

