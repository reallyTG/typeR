context("Testing the trawl autocorrelation functions in TrawlCorrelationFunctions.R")

test_that("Function acf_Exp works",{
  expect_equal(acf_Exp(0,0.1),1)
  expect_equal(acf_Exp(1,0.1),base::exp(-1*0.1))
  expect_equal(acf_Exp(10,0.1),base::exp(-10*0.1))
  expect_equal(acf_Exp(0,0.01),1)
  expect_equal(acf_Exp(1,0.01),base::exp(-1*0.01))
  expect_equal(acf_Exp(10,0.01),base::exp(-10*0.01))
})

test_that("Function acf_DExp works",{
  expect_equal(acf_DExp(0,0.1,0.1,1),1)
  expect_equal(acf_DExp(1,0.1,0.1,1),(0.1*base::exp(-1*0.1)/0.1+0.9*base::exp(-1*1)/1)/(0.1/0.1+0.9/1))
  expect_equal(acf_DExp(10,0.1,0.1,1),(0.1*base::exp(-10*0.1)/0.1+0.9*base::exp(-10*1)/1)/(0.1/0.1+0.9/1))
  expect_equal(acf_DExp(0,0.1,0.1,1),1)
  expect_equal(acf_DExp(1,0,0.1,0.01),base::exp(-1*0.01))
  expect_equal(acf_DExp(10,0,0.1,0.01),base::exp(-10*0.01))
})

test_that("Function acf_supIG works",{
  expect_equal(acf_supIG(0,0.1,0.5),1)
  expect_equal(acf_supIG(1,0.1,0.5),base::exp(0.1*0.5*(1-base::sqrt(1+2*1/0.5^2))))
  expect_equal(acf_supIG(10,0.1,0.5),base::exp(0.1*0.5*(1-base::sqrt(1+2*10/0.5^2))))
})

test_that("Function acf_LM works",{
  expect_equal(acf_LM(0,0.1,1.1),1)
  expect_equal(acf_LM(1,0.1,1.1),(1+1/0.1)^(-0.1))
  expect_equal(acf_LM(10,0.1,1.1),(1+10/0.1)^(-0.1))
})
