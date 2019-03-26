## Some specific algebraic identities (here Euler's four-square
## identity and the Brahmagupta-Fibonacci identity), which are usually
## applied to real numbers but work for any commutative ring (such as
## multivariate polynomials).  The script defines some checker 



library("mvp")

## Brahmagupta-Fibonacci:

bf <- function(a1,a2,a3,a4,n){
  LHS <- (a1^2 + n*a2^2)*(a3^2 + n*a4^2)
  RHS <- (a1*a3-n*a2*a4)^2 + n*(a1*a4 +a2*a3)^2
  stopifnot(LHS == RHS)
  return(TRUE)
}


# Euler's four-square identity:
euler_four_square <- function(a1,a2,a3,a4,b1,b2,b3,b4){
  LHS <- 
    (a1^2 + a2^2 + a3^2 + a4^2)*
    (b1^2 + b2^2 + b3^2 + b4^2)
  
  RHS <- (
    +(a1*b1 - a2*b2 - a3*b3 - a4*b4)^2
    +(a1*b2 + a2*b1 + a3*b4 - a4*b3)^2
    +(a1*b3 - a2*b4 + a3*b1 + a4*b2)^2
    +(a1*b4 + a2*b3 - a3*b2 + a4*b1)^2
  )
  stopifnot(RHS==RHS)
  return(TRUE)
}

bf(rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4),7)

euler_four_square(
    rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4),
    rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4), rmvp(2,3,2,4)
)


## misc checks:
stopifnot(constant(0) == as.mvp(0))

