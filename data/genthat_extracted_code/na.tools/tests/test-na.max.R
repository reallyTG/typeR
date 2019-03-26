#' test-na.max.R 

source("utils.R")

context("na.max")
test_that("na.max", {
  
  x <- 1:4
  x[c(2,4)] <- NA
  
  ans <- c(1,3,3,3)
  x->.; na.max(.) ->.; 
    expect_is(., "integer") 
    expect_equal(., ans)
  
  
  x_num <- as.numeric(x)
  x_num ->.; na.max(.) ->.;  
    expect_is(., "numeric") 
    expect_equal(., ans)
  
  
  x <- letters[1:4]
  x[c(2,4)] <- NA
  
  ans <- qw(a,c,c,c)
  x ->.; na.max(.) ->.; 
    expect_is(., "character")
    expect_equal(., ans)
  
  x <- as.factor(x)
  expect_error({ na.max(x) })
  
})



context("na.min")
test_that("na.min", {
  
  x <- 1:4
  x[c(2,4)] <- NA
  
  ans <- c(1,1,3,1)
  x ->.;  na.min(.)  ->.;  
    expect_is(., "integer") 
    expect_equal(., ans)
  
  
  x_num <- as.numeric(x)
  x_num ->.; na.min(.)  ->.;  
    expect_is(., "numeric")
    expect_equal(., ans)
  
  x <- letters[1:4]
  x[c(2,4)] <- NA
  
  ans <- qw(a,a,c,a)
  x ->.; na.min(.) ->.; 
    expect_is(., "character") 
    expect_equal(., ans)
  
  x <- as.factor(x)
  expect_error(na.min(x))

})

