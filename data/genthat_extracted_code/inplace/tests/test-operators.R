################################################################################

context("test-operators.R")

################################################################################

address <- data.table::address

r <- function(n, type) {
  x <- rnorm(n, mean = 100, sd = 10)
  `if`(type == "integer", round(x), x)
}

################################################################################

test_that("in-place operators work in common cases", {
  
  test_fun <- function(x, val) {
    
    call_x   <- deparse(substitute(x))
    call_val <- deparse(substitute(val))
    addr0 <- address(X)
    
    assign <- sprintf("X2 <- X; %s <- %s",
                      sub("^X", "X2", call_x),
                      paste(call_x, op, call_val))
    
    eval(parse(text = assign), parent.frame())
    expect_false(eval(parse(text = "identical(X, X2)"), parent.frame()))
    
    assign <- sprintf("%s %%%s<-%% %s", call_x, op, call_val)
    eval(parse(text = assign), parent.frame())
    expect_identical(X, X2)
    expect_identical(address(X), addr0)
  }
  
  multiply_all_one <- function(x, i, j, val) {
    stop("Don't call the right function.")
  }
  
  for (type in c("double", "integer")) {
    
    OPS <- c('*', '/', '-', '+')
    if (type == "integer") OPS <- setdiff(OPS, '/')
    
    for (op in OPS) {
      
      for (dim_X in list(NULL, c(8, 32))) {
        
        X <- rnorm(256, mean = 0, sd = 10)
        dim(X) <- dim_X
        
        one_val  <- r(1, type)
        five_val <- r(5, type)
        
        test_fun(X, one_val)
        test_fun(X[], one_val)
        test_fun(X[1:5], five_val)
        test_fun(X[6:10], five_val)
        
        if (is.matrix(X)) {
          
          n_val <- r(nrow(X), type)
          m_val <- r(ncol(X), type)
          
          test_fun(X[2, ],   one_val)
          test_fun(X[2, ],   m_val)
          test_fun(X[1:5, ], rep(m_val, 5))
          
          test_fun(X[, 2],   one_val)
          test_fun(X[, 2],   n_val)
          test_fun(X[, 1:5], rep(n_val, 5))
          
          test_fun(X[2, 2], one_val)
          test_fun(X[cbind(1:5, 1:5)], one_val)
          test_fun(X[cbind(1:5, 1:5)], five_val)
          
          for (ind in list(1:5, -(1:5), c(TRUE, FALSE, TRUE))) {
            
            test_fun(X[ind,    ], one_val)
            test_fun(X[ind,   2], one_val)
            test_fun(X[   , ind], one_val)
            test_fun(X[  2, ind], one_val)
            test_fun(X[ind, ind], one_val)
            
          }
          
        }
        
      }
      
    } 
    
  }
  
})

################################################################################

test_that("in-place operators error in special cases", {
  
  for (dim_X in list(NULL, c(2, 3))) {
    
    X <- 1:6
    dim(X) <- dim_X
    X2 <- X + 0
    
    # Can't use non-integer values with integers
    expect_error(X %*<-% 2.2)
    expect_null(X2 %*<-% 2)
    expect_null(X2 %*<-% 2.2)
    
    # Integers can't be divided
    expect_error(X %/<-% 2.2)
    expect_error(X %/<-% 2)
    expect_error(X[1, ] %/<-% 2.2)
    expect_error(X[1, ] %/<-% 2)
    # Doubles can be divided
    expect_null(X2 %/<-% 2.2)
    expect_null(X2 %/<-% 2)
    # Not a matrix
    if (is.matrix(X2)) {
      expect_null(X2[1, ] %/<-% 2.2)  
      expect_null(X2[1, ] %/<-% 2)
      expect_null(X2[, 2:3] %/<-% 2.2)  
      expect_null(X2[, 2:3] %/<-% 2)
    } else {
      expect_error(X2[1, ] %/<-% 2.2)  
      expect_error(X2[1, ] %/<-% 2)
      expect_error(X2[, 2:3] %/<-% 2.2)  
      expect_error(X2[, 2:3] %/<-% 2)
    }
  
    # Works only with integers and doubles
    X3 <- as.raw(X); dim(X3) <- dim(X)
    expect_error(X3 %*<-% 3)
    expect_error(X3[1:5] %*<-% 3)
    
    ## Need corresponding sizes
    expect_error(X2 %*<-% 1:2)
    expect_error(X2 %*<-% 1:7)
    
  }
  
})

################################################################################
