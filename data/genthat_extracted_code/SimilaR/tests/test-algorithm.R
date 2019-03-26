##    SimilaR package for R
##    Copyright (C) 2018 M. Bartoszuk, M. Gagolewski
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.

library("testthat")
library("SimilaR")
context("algorithm")

test_that("return", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      return(NULL)
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      return(y)
    }
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                                  scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

test_that("aliases", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    longName <- x
    longName2 <- min
    stopifnot(is.numeric(longName))
    stopifnot(length(longName) > 1)
    
    if(abs(max(longName)-longName2(longName)) < 1e-5)
      NULL
    else
    {
      y <- (longName - longName2(longName))/(max(longName)-longName2(longName))
      y
    }
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                                  scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

test_that("function_combining", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    stopifnot(is.numeric(x))
    
    len_x <- length(x) 
    is_len_x_greater_1 = len_x > 1
    stopifnot(is_len_x_greater_1)
    
    
    max_x <- max(x)
    min_x <- min(x)
    abs_max_min <- abs(max_x-min_x)
    if(abs_max_min < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                                  scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

test_that("multiple_calls", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  
  scaling2 <- function(x)
  {
    stopifnot(is.numeric(x))
    len_x <- length(x)
    stopifnot(len_x > 1)
    
    min_x <- min(x)
    max_x <- max(x)
    
    if(abs(max_x-min_x) < 1e-5)
      NULL
    else
    {
      y <- (x - min_x)/(max_x-min_x)
      y
    }
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                           scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

test_that("stopifnot", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    stopifnot(is.numeric(x), length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling3 <- function(x)
  {
    stopifnot(is.numeric(x) && length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  res <- rbind(
    SimilaR_fromTwoFunctions(scaling, 
                             scaling2, returnType = "data.frame", aggregation = "both"),
    SimilaR_fromTwoFunctions(scaling, 
                             scaling3, returnType = "data.frame", aggregation = "both"),
    SimilaR_fromTwoFunctions(scaling2, 
                             scaling3, returnType = "data.frame", aggregation = "both"))
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
  expect_equal(res[2, 3], 1)
  expect_equal(res[2, 4], 1)
  expect_equal(res[2, 5], 1)
  expect_equal(res[3, 3], 1)
  expect_equal(res[3, 4], 1)
  expect_equal(res[3, 5], 1)
})

test_that("order", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    stopifnot(length(x) > 1)
    stopifnot(is.numeric(x))
    
    if(abs(max(x)-min(x)) >= 1e-5)
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
    else
      NULL
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                                  scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

test_that("dead_code", {
  scaling <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    if(abs(max(x)-min(x)) < 1e-5)
      NULL
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  scaling2 <- function(x)
  {
    stopifnot(is.numeric(x))
    stopifnot(length(x) > 1)
    
    z1 <- runif(100, -5, 5)
    z2 <- 2*z1+3+rnorm(100, 0, 0.2)
    
    beta <- sum((z1 - mean(z1))*(z2-mean(z2)))/(sum((z1-mean(z1))^2))
    alpha <- mean(z2) - beta*mean(z1)
    
    if(abs(max(x)-min(x)) < 1e-5)
    {
      NULL
    }
    else
    {
      y <- (x - min(x))/(max(x)-min(x))
      y
    }
  }
  
  res <- SimilaR_fromTwoFunctions(scaling, 
                           scaling2, returnType = "data.frame", aggregation = "both")
  
  expect_true(is.data.frame(res))
  expect_equal(res[1, 3], 1)
  expect_equal(res[1, 4], 1)
  expect_equal(res[1, 5], 1)
})

