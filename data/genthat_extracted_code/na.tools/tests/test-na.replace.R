# test-na.replace.R 

replace_with_mean <- function(x) mean(x, na.rm=TRUE )  

context("na.replace")

context(".. continous-integer")
test_that("na.replace-continuous-integer", {

# REPLACE with scalar 
  v <- 1:3
  v[2] <- NA_integer_
  
  ans <- c(1,0,3)
  v ->.; na.replace(., 0)  ->.;  
    expect_is(., "integer") 
    expect_equal(., ans)
    
  ans <- 1:3
  v ->.; na.replace(., 2)  ->.;  
    expect_is(., "integer") 
    expect_equal(., ans)  
  
  v <- 1:4
  v[ c(2,4) ] <- NA_integer_
  
  ans <-  c(1,2,3,2)
  v ->.; na.replace(., 2)  ->.;  
    expect_is(., "integer") 
    expect_equal(., ans)    # 1 2 3 2

# REPLACE with VECTOR
  ans <- 1:4
  v ->.; na.replace(.,1:4)  ->.;  
    expect_is(., "integer")  
    expect_equal(., ans)             # 1 2 3 4

 # REPLACE with FUNCTION 
  ans <- c(1,2,3,2)
  v ->.; na.replace(., .na=replace_with_mean )  ->.; 
    expect_is(., "integer") 
    expect_equal(., ans)    # 1 2 3 2
   
# REPLACE by non-consistent class/type
  expect_error( na.replace(v,"a") )
  
# REPLACE by inconsistent length
  expect_error( na.replace(v,1:2) )
  
})


context(".. continous-numeric")
test_that("na.replace-continuous-integer", {

# REPLACE with scalar 
  v <- as.numeric(1:3)
  v[2] <- NA_real_
  
  ans <- c(1,0,3)
  v ->.; na.replace(.,0) ->.;  
    expect_is(., "numeric") 
    expect_equal(., ans)
  
  ans <- 1:3
  v ->.; na.replace(.,2) ->.;  
    expect_is(., "numeric") 
    expect_equal(., ans)  
  
  v <- 1:4
  v[ c(2,4) ] <- NA_real_
  ans <- c(1,2,3,2)
  v ->.; na.replace(., 2) ->.;  
    expect_is(., "numeric") 
    expect_equal(., ans)    # 1 2 3 2

# REPLACE with VECTOR
  ans <- 1:4
  v ->.; na.replace(.,1:4)  ->.;  
    expect_is(., "numeric")
    expect_equal(., ans)             # 1 2 3 4

# REPLACE with FUNCTION
  ans <- c(1,2,3,2)
  v ->.; na.replace( ., .na=replace_with_mean )  ->.; 
    expect_is(., "numeric") 
    expect_equal(., ans)    # 1 2 3 2

   
# REPLACE with non-consistent class/type
  expect_error( na.replace(v,"a") )

# REPLACE by inconsistent length
  expect_error( na.replace(v, 1:2) )
  
})



context(".. character")
test_that("na.replace-character", {

# REPLACE with SCALAR
  v <- letters[1:4]
  v[c(2,4)] <- NA_character_
  
  ans <- qw(a,x,c,x)
  v ->.; na.replace(.,"x") ->.; 
    expect_is(., "character") 
    expect_equivalent(., ans)
  
# REPLACE with VECTOR
  ans <- letters[1:4]
  v ->.; na.replace(., letters[1:4]) ->.; 
    expect_is(., "character")  
    expect_equivalent(., ans) 

 # REPLACE with FUNCTION 
   ans <- qw(a,x,c,x)
   v ->.; na.replace( ., function(x) "x" ) ->.;  
    expect_is(., "character")  
    expect_equal(., ans)    # 1 2 3 2
  
  
  
# REPLACE by DEFAULT
  ans <- qw(a,(NA),c,(NA))  
  v ->.; na.replace(.) ->.; 
    expect_is(., "character") 
    expect_equivalent(., ans) 


# REPLACE with non-consistent class
  ans <- c("a","1","c","1")
  v  ->.; na.replace(., 1L) ->.; 
    expect_is(., "character") 
    expect_equivalent(., ans)

# REPLACE by inconsistent length
  expect_error( na.replace( ., qw(X,Y) ) )
      
})  
  

context( ".. factor")
test_that( "na.replace factor", { 
  
  fct <- letters[1:5] 
  fct[c(2,5)] <- NA 
  fct <- as.factor(fct)

# REPLACE with scalar
  ans <- factor( qw(a, z, c, d, z) )
  fct ->.; na.replace(., "z") ->.; 
    expect_is(. , "factor")  
    expect_equivalent( ., as.factor(ans) )
    expect_equal(., ans )
    
# REPLACE with vector 
  ans <- factor( letters[1:5], levels=qw(a,c,d,b,e) ) 
  fct ->.; na.replace(., letters[1:5]) ->.;  
    expect_is(., "factor")
    expect_equivalent(., ans)
    expect_equal(., ans)
  
# REPLACE with FUNCTION 
  ans <- factor( qw(a, z, c, d, z) )
  fct ->.; na.replace( ., .na=function(x) "z" ) ->.;  
    expect_is(., "factor") 
    expect_equal(., ans)    # 1 2 3 2
    
  
# REPALCE with  default
  ans <- factor( qw(a,(NA),c,d,(NA)), levels=qw(a,c,d,(NA)) ) 
  fct ->.; na.replace(.) ->.;  
    expect_is(., "factor")
    expect_equivalent(., ans)
  
# REPLACE by inconsistent length
  expect_error( na.replace(fct, 1:2) )
  
})
