# Unit test 
# 
# Author: Renaud Gaujoux
# Created: 01 May 2018
# Copyright: Cytoreason (2017)
###############################################################################

context("Formatting functions")

library(stringr)
library(pkgmaker)

# RUnit-testthat bridge 
checkIdentical <- function(x, y, msg){
  expect_identical(x, y, info = msg)
  
}
checkTrue <- function(x, y, msg){
  expect_true(x, info = msg)
  
}
##

checkFun <- function(fn, name){
  
  function(x, ...){
    
    oldRNG <- RNGseed()
    if( !missing(x) ){
      d <- fn(x)
      obj <- getRNG(x)
      cl <- class(x)
    }else{
      d <- fn()
      obj <- getRNG()
      cl <- 'MISSING'
    }
    newRNG <- RNGseed()
    msg <- function(x, ...) paste(name, '-', cl, ':', x, '[', ..., ']')
    expect_identical(oldRNG, newRNG, info = msg("does not change RNG", ...))
    
    #
    expect_true( isString(d), info = msg("result is a character string", ...))
    expect_identical(d, fn(obj), info = msg("digest is from the RNG setting", ...))
    
  }
}

test_that('RNGdigest and RNGstr', {
  
  RNGkind('default', 'default')
  on.exit( RNGrecovery() )
  
  fn <- c('RNGdigest', 'RNGstr')
  sapply(fn, function(f){
        fn <- getFunction(f, where='package:rngtools')
        checker <- checkFun(fn, f)
        
        checker()
        checker(1234)
        checker(1:3, 'Valid seed')
        checker(2:3, 'Invalid seed')
        x <- list(10, rng=c(401L, 1L, 1L))
        checker(x, 'list with rng slot')
        
      })
  TRUE
  
})

checkRNGtype <- function(x, ..., expL=2L){
  
  fn <- RNGtype
  oldRNG <- getRNG()
  if( !missing(x) ){
    d <- fn(x)
    obj <- getRNG(x)
    cl <- str_c(class(x), '(', length(x), ')')
  }else{
    d <- fn()
    obj <- getRNG()
    cl <- 'MISSING'
  }
  newRNG <- getRNG()
  msg <- function(x, ...) paste(cl, ':', x, '[', ..., ']')
  expect_identical(oldRNG, newRNG, info = msg("does not change RNG", ...))
  
  #
  expect_true( is.character(d), msg("result is a character vector", ...) )
  expect_identical( length(d), expL, info = msg("result has correct length (", expL, ")", ...) )
  
}

test_that('RNGtype', {
  
  RNGkind('default', 'default')
  on.exit( RNGrecovery() )
  checker <- checkRNGtype
  
  checker()
  checker(1234, 'Valid single numeric seed')
  checker(1:3, 'Valid seed')
  checker(402L, 'Valid encoded kind')
  expect_true( !identical(RNGtype(402), RNGtype(402L)), "Single integer and real number does not give the same result")
  x <- list(10, rng=c(401L, 1L, 1L))
  checker(x, 'list with rng slot')
  
  # errors
  oldRNG <- getRNG()
  expect_error(RNGtype(2:3), info = "Error with invalid length seed")
  expect_identical(oldRNG, getRNG(), info = "RNG still valid after error")
  #
  
  oldRNG <- getRNG()
  expect_error(RNGtype(123L), info = "Error with invalid RNG kind")
  expect_identical(oldRNG, getRNG(), info = "RNG still valid after error")
  expect_error(RNGtype(1234L), info = "Error with invalid RNG integer")
  expect_identical(oldRNG, getRNG(), info = "RNG still valid after error")
  
})
