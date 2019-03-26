context("JR method")

data('schools')


##### 3 Level JR ######

rlme.fit = rlme(y ~ 1 + sex + age + (1 | region) + (1 | region:school), schools, method="jr", rprpair='hl-disp')

test_that("3 Level JR calculates correct fixed effects for schools data", {  
  expect_equal(rlme.fit$fixed.effects$Estimate, c(2.333455e-01, -4.192000e-01, 1.530568e-11), tolerance=0.0001)
})

test_that("3 Level JR calculates correct covariance matrix for school data", {
  correct.var.b = matrix(c(0.0031823926, 0.0001276718,
                           0.0001276718, 0.0052205201), nrow=2, ncol=2)
  
  # JR returns a slightly different value each time, so we'll
  # set a pretty low tolerance here
  
  expect_equal(unname(rlme.fit$var.b), correct.var.b, tolerance = 0.01)
})


##### 3 Level HL-Disp #####

test_that("3 Level JR calculates correct random effect variances for school data (hl-disp)", {
  expect_equal(rlme.fit$random.effects$Variance, c(0.12789938, 0.02439996, 0.82100813), tolerance=0.01)
})


##### 3 Level Med-Mad #####

rlme.fit = rlme(y ~ 1 + sex + age + (1 | region) + (1 | region:school), schools, method="jr", rprpair='med-mad')

test_that("3 Level JR calculates correct random effect variances for school data (med-mad)", {
  expect_equal(rlme.fit$random.effects$Variance, c(0.02413033, 0.09661348, 0.38645392), tolerance=0.01)
})


##### 2 Level JR #####

rlme.fit = rlme(y ~ 1 + sex + age + (1 | region), schools, method="jr", rprpair='hl-disp')

test_that("2 Level JR calculates correct fixed effects for schools data", {  
  expect_equal(rlme.fit$fixed.effects$Estimate, c(2.333455e-01, -4.192000e-01, 1.530568e-11), tolerance=0.0001)
})

test_that("2 Level JR calculates correct covariance matrix for school data", {
  correct.var.b = matrix(c(2.286629e-03, 7.562458e-05,
                           7.562458e-05, 5.959317e-03), nrow=2, ncol=2)
  
  expect_equal(unname(rlme.fit$var.b), correct.var.b, tolerance = 0.01)
})


##### 2 Level HL-Disp #####

test_that("2 Level JR calculates correct random effect variances for school data (hl-disp)", {
  expect_equal(rlme.fit$random.effects$Variance, c(0.1670331, 0.8385507), tolerance=0.01)
})


##### 2 Level Med-Mad #####

rlme.fit = rlme(y ~ 1 + sex + age + (1 | region), schools, method="jr", rprpair='med-mad')

test_that("2 Level JR calculates correct random effect variances for school data (med-mad)", {
  expect_equal(rlme.fit$random.effects$Variance, c(5.495256e-09, 3.864539e-01), tolerance=0.01)
})