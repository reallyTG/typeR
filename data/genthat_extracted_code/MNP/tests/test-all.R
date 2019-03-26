rm(list=ls())
library(MNP)
library(testthat)
context("tests MNP")

test_that("tests MNP on the detergent data", {
  # set random seed
  set.seed(12345)
  
  # load the detergent data
  data(detergent)
  # run the standard multinomial probit model with intercepts and the price
  res1 <- mnp(choice ~ 1, choiceX = list(Surf=SurfPrice, Tide=TidePrice,
              Wisk=WiskPrice, EraPlus=EraPlusPrice, Solo=SoloPrice, All=AllPrice),
              cXnames = "price", data = detergent, n.draws = 30, burnin = 10,
              thin = 3, verbose = TRUE)
  # summarize the results
  x <- summary(res1)
  expect_that(length(x), is_equivalent_to(8))
  expect_true("coef.table" %in% names(x))
  expect_equal(x$coef.table[4, 1], 1.864768, tolerance = 0.001)
  expect_equal(x$coef.table["(Intercept):Solo", "2.5%"], 1.108233, tolerance = 0.001)
  expect_equal(x$cov.table[10, 1], 0.9855489, tolerance = 0.001)
  expect_equal(x$cov.table["Tide:Tide", "mean"], 0.7952514, tolerance = 0.001)
  
  # calculate the quantities of interest for the first 3 observations
  x <- predict(res1, newdata = detergent[1:3,])
  expect_that(length(x), is_equivalent_to(4))
  expect_true("p" %in% names(x))
  expect_that(dim(x$o), is_equivalent_to(c(3, 6, 5)))
  expect_equal(as.numeric(x$p[1, 3]), 0.2, tolerance = 0.05)
  expect_equal(as.numeric(x$p[3, "Wisk"]), 0.4, tolerance = 0.05)
})  


test_that("tests MNP on the Japanese election census", {
  # set random seed
  set.seed(12345)

  # load the Japanese election data
  data(japan)
  # run the multinomial probit model with ordered preferences
  res2 <- mnp(cbind(LDP, NFP, SKG, JCP) ~ gender + education + age, data = japan, verbose = TRUE)
  # summarize the results
  x <- summary(res2)
  expect_that(length(x), is_equivalent_to(8))
  expect_true("coef.table" %in% names(x))
  expect_equal(x$cov.table[2,1], 1.01725, tolerance = 0.01)
  expect_equal(x$cov.table["LDP:LDP", "mean"], 0.9667556, tolerance = 0.01)

  # calculate the predicted probabilities for the 10th observation
  # averaging over 100 additional Monte Carlo draws given each of MCMC draw.
  x <- predict(res2, newdata = japan[10,], type = "prob", n.draws = 100, verbose = TRUE)
  expect_that(length(x), is_equivalent_to(2))
  expect_true("p" %in% names(x))
  expect_that(dim(x$p), is_equivalent_to(c(1, 4, 5000)))
  expect_that(x$x[1, "age:LDP"], is_equivalent_to(50))
  expect_that(x$x[1, 1], is_equivalent_to(1))
})  


