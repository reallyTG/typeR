## * header
rm(list = ls())
if(TRUE){ ## already called in test-all.R
    library(testthat)
    library(lavaSearch2)
}

lava.options(symbols = c("~","~~"))

context("initVarLink")

## * tests

lava.options(symbols = c("~","~~"))

test_that("initVar - two different variables",{
  l <- list(var1 = "a", var2 = "b")  
  f <- a~b
  # regression
  expect_equal(l, initVarLink(var1 = a~b))
  expect_equal(l, initVarLink(var1 = a ~ b))
  expect_equal(list(f),initVarLink(var1 = "a ~ b", format = "formula"))
  # covariance
  expect_equal(l, initVarLink(var1 = "a~~b"))
  # var
  expect_equal(l, initVarLink(var1 = "a", var2 = "b"))
})

test_that("initVar - one repeated variable",{
  
  l <- list(var1 = "X1", var2 = "X1")
  # regression
  expect_equal(l, initVarLink(var1 = X1~X1))
  expect_equal(l, initVarLink(var1 = "X1~~X1"))
})

test_that("initVar - no response variable",{
  
  l1 <- list(var1 = NULL, var2 = "X1")
  l12 <- list(var1 = NULL, var2 = c("X1","X2"))
  # regression
  expect_equal(l1, initVarLink(var1 = ~X1))
  expect_equal(l12, initVarLink(var1 = ~X1+X2))
})


initVarLink(var1 = a ~ b+c+d*e, format = "list")
initVarLink(var1 = a ~ b+c+d*e, format = "txt.formula")
initVarLink(var1 = a ~ b+c+d*e, format = "formula")




initVarLink(var1 = Y~X1+X2)
initVarLink(var1 = Y~X1+X2, rep.var1 = TRUE)
initVarLink(var1 = Y~X1+X2, format = "formula")
initVarLink(var1 = Y~X1+X2, format = "txt.formula")

lava.options(symbols = c("<-","<->"))
initVarLink(var1 = "Y<-X1+X2", rep.var1 = TRUE)
initVarLink(var1 = "Y<-X1+X2", format = "formula")
initVarLink(var1 = "Y<-X1+X2", format = "txt.formula")



