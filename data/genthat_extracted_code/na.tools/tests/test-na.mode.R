# test-na.mode.R

context("na.mode")

context(".. continous-integer")
test_that("na.mode-continuous-integer", {

# REPLACE with scalar 

  v <- 1:4
  v[ c(2,4) ] <- NA_integer_
  
 # REPLACE with FUNCTION 
  ans <- c(1,1,3,1)
  v ->.; na.mode(.)  ->.;  
    expect_is(., "integer") 
    expect_equal(., ans)   
   
# REPLACE by non-consistent class/type
  # expect_error( v %>% na.mode("a") )
  
# REPLACE by inconsistent length
  # expect_error( v %>% na.mode() )
  
})


context(".. continous-numeric")
test_that("na.mode-continuous-integer", {

  v <- 1:4
  v[ c(2,4) ] <- NA_real_
  
# REPLACE with FUNCTION
  ans <- c(1,1,3,1)
  v ->.; na.mode(.)  ->.; 
    expect_is(., "numeric")
    expect_equal(.,ans)    # 1 2 3 2

   
# REPLACE with non-consistent class/type
  # expect_error( v %>% na.mode("a") )

# REPLACE by inconsistent length
  # expect_error( v %>% na.mode(1:2) )
  
})

context(".. categorical-character")
test_that("na.mode-continuous-integer", {
  
  x <- letters[1:4]
  x[ c(2,4) ] <- NA
  
  ans <- c('a','a','c','a')
  x ->.; na.mode(.)  ->.;  
    expect_is(., "character")
    expect_equal(., ans)
  
})