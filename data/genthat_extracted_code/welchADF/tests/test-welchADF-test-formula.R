
library(welchADF)

test_that("welchADF.test.formula with a data in variables outside a data.frame", {
  
  ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
  trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
  group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
  weight <- c(ctl, trt)
  
  expect_true({omnibus <- welchADF.test(weight ~ group); TRUE})
  expect_true({print(omnibus); TRUE})
  expect_true({print(summary(omnibus)); TRUE})
  expect_true({updated = update(omnibus, trimming = TRUE); TRUE})
  expect_true({formula(omnibus); TRUE})
  expect_true({model.frame(omnibus); TRUE})
})

test_that("welchADF.test.formula with a mixed between x within-subjects model", {
  
  # just test this does not throw errors
  omnibus_LSM_multi_form <- welchADF.test(cbind(TargetAlone, Congruent, Neutral, Incongruent)
                                          ~ Group, data = adhdData)
    
  expect_true({print(omnibus_LSM_multi_form); TRUE})
  expect_true({print(summary(omnibus_LSM_multi_form)); TRUE})
  expect_true({formula(omnibus_LSM_multi_form); TRUE})
  expect_true({updated = update(omnibus_LSM_multi_form, TargetAlone ~ .); TRUE})
  expect_true({formula(updated); TRUE})
  expect_true({model.frame(updated); TRUE})
})

test_that("welchADF.test.formula with a doubly-multivariate model", {
  
  # just test this does not throw errors
  expect_true({omnibus_LSM_multi_form <- welchADF.test(cbind(visits, time, latency) ~ nurs*tunnel + (tunnel|Subject), data = miceData); TRUE})
  expect_true({print(omnibus_LSM_multi_form); TRUE})
  expect_true({print(summary(omnibus_LSM_multi_form)); TRUE})
  expect_true({formula(omnibus_LSM_multi_form); TRUE})
  expect_true({updated = update(omnibus_LSM_multi_form, latency ~ .); TRUE})
  expect_true({model.frame(updated); TRUE})
})