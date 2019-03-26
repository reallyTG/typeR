## This file follows the structure of aaa.R in the free group package.

## Define some checker functions, and call them at the end.  They
## should all return TRUE if the package works, and stop with error if
## a test is failed.  Function checker1() has one argument, checker2()
## two, and checker3() has three.  

library("mvp")

checker1 <- function(x){
  stopifnot(x==x)

  stopifnot(x == x + constant(0))
  stopifnot(x == x + 0)
  stopifnot(x == (x + 4) -4)
  stopifnot(x == -(-x))
  stopifnot(x == +(+x))

  stopifnot(x+x-x == x)

  stopifnot(is.zero(x-x))

  stopifnot(0*x == constant(0))
  stopifnot(1*x == x)
  stopifnot(2*x == x+x)
  stopifnot(3*x == x+x+x)
  stopifnot(4*x == x+x+x+x)
  stopifnot(5*x == x+x+x+x+x)
  stopifnot(6*x == x+x+x+x+x+x)

  stopifnot(x^0 == constant(1))
  stopifnot(x^1 == x)
  stopifnot(x^2 == x*x)
  stopifnot(x^3 == x*x*x)
  stopifnot(x^4 == x*x*x*x)

  ## check constant() and constant<-():
  ## checks below include 
  y <- x
  stopifnot(constant(x) == constant(y))
  constant(y) <- 4
  stopifnot(constant(y) == 4)
  constant(y) <- 0
  stopifnot(constant(y) == 0)
  
  
  ## check invert():
  stopifnot(invert(invert(x))==x)
  if(length(allvars(x))>0){
    v <- allvars(x)[1]
    stopifnot(invert(invert(x,v[1]),v[1])==x)
  }

  if(length(allvars(x))>0){
    v <- allvars(x)[1]
    stopifnot(invert(invert(x,v[1]),v[1])==x)
  }
    
  ## check subs():
  if(length(allvars(x))>0){
    v <- allvars(x)[1]
    jj1 <- list(2)
    names(jj1) <- v
    jj2 <- list(1/2)
    names(jj2) <- v

    LHS <- do.call("subsy",list(x,jj1))
    RHS <- invert(do.call("subsy",list(invert(x),jj2)))
    stopifnot(LHS == RHS)
  }  

## check subsmvp():
  if(length(allvars(x))>0){
    v <- allvars(x)[1]
    stopifnot(x == subsmvp(x,v,as.mvp(v)))
  }
  
  ## check d(X^n)/dt = nX^(n-1)dX/dt:
  if(length(allvars(x))>0){
    v <- allvars(x)[1]
    for(i in seq_len(5)){
      stopifnot(deriv(x^i,v) == i*x^(i-1)*deriv(x,v))
    }
  }

  ## check d^2X/dudv = d^2X/dvdu: 
  if(length(allvars(x))>1){
    v <- allvars(x)[1:2]
    stopifnot(deriv(x,v) == deriv(x,rev(v)))
  }

  ## check the chain rule, here dx/dv = (dx/dy)*(dy/dv):
  if((length(allvars(x))>1)   & (! "y" %in% allvars(x)) ){

    v <- allvars(x)[1]
    s <- as.mvp("1  +  y  -  y^2 zz  +  y^3 z^2")
    
    LHS <- subsmvp(deriv(x,v)*deriv(s,"y"),v,s)
    RHS <- deriv(subsmvp(x,v,s),"y")
    stopifnot(LHS == RHS)
}
  return(TRUE)
}  # checker1() closes


checker2 <- function(x,y){
  stopifnot(x == -y+x+y)
  stopifnot(x+y == x-(-y))

  stopifnot(x+y == y+x)

  stopifnot((-x)*y == -(x*y))
  stopifnot(x*(-y) == -(x*y))

  stopifnot(x*y == y*x)


  stopifnot(x^2-y^2 == (x+y)*(x-y))  # not as obvious as it looks
  
  stopifnot(x^3+y^3 == (x+y)*(x^2-x*y+y^2))  # ditto
  stopifnot(x^3-y^3 == (x-y)*(x^2+x*y+y^2))

  
  ## check product rule for differentiation:
  if(length(allvars(x))>1){
    v <- allvars(x)[1]
    stopifnot(deriv(x*y,v) == x*deriv(y,v) + deriv(x,v)*y)
  }
  return(TRUE)
}

checker3 <- function(x,y,z){
  stopifnot(x+(y+z) == (x+y)+z) # associativity
  stopifnot(x*(y*z) == (x*y)*z) # associativity

  stopifnot(x*(y+z) == x*y + x*z)  # distributivity
  stopifnot((y+z)*x == x*y + x*z)  # distributivity

  ## check the product rule for triples:
  if(length(allvars(x))>1){
    v <- allvars(x)[1]
    stopifnot(deriv(x*y*z,v) ==
              deriv(x,v)*y*z + 
              x*deriv(y,v)*z + 
              x*y*deriv(z,v)
              )
  }
  # factorization:
  stopifnot(
  (x+y+z)*(x^2+y^2+z^2-x*y-y*z-x*z) == x^3+y^3+z^3-3*x*y*z
  )

  
  return(TRUE)
} # checker3() closes






for(i in 1:2){
    x <- rmvp(5)
    y <- rmvp(5)
    z <- rmvp(5)
    
    checker1(x)
    checker2(x,y)
    checker3(x,y,z)
}

print("finished")

## Brahmagupta-Fibonacci:

bf <- function(a1,a2,a3,a4,n){
  LHS <- (a1^2 + n*a2^2)*(a3^2 + n*a4^2)
  RHS <- (a1*a3-n*a2*a4)^2 + n*(a1*a4 +a2*a3)^2
  return(LHS == RHS)
}


# Euler's four-square identity:
checker8 <- function(a1,a2,a3,a4,b1,b2,b3,b4){
  LHS <- 
    (a1^2 + a2^2 + a3^2 + a4^2)*
    (b1^2 + b2^2 + b3^2 + b4^2)
  
  RHS <- (
    +(a1*b1 - a2*b2 - a3*b3 - a4*b4)^2
    +(a1*b2 + a2*b1 + a3*b4 - a4*b3)^2
    +(a1*b3 - a2*b4 + a3*b1 + a4*b2)^2
    +(a1*b4 + a2*b3 - a3*b2 + a4*b1)^2
  )
  return(RHS==RHS)
}

bf(rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4),7)

checker8(
    rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4),
    rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4)
)


## misc checks:
stopifnot(constant(0) == as.mvp(0))

