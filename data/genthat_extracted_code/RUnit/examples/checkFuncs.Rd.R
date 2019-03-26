library(RUnit)


### Name: checkFuncs
### Title: RUnit check functions
### Aliases: checkEquals checkEqualsNumeric checkIdentical checkTrue
###   checkException DEACTIVATED
### Keywords: programming

### ** Examples


checkTrue(1 < 2, "check1")     ## passes fine
## checkTrue(1 > 2, "check2")  ## appears as failure in the test protocol

v <- 1:3
w <- 1:3
checkEquals(v, w)               ## passes fine
names(v) <- c("A", "B", "C")
## checkEquals(v, w)            ## fails because v and w have different names
checkEqualsNumeric(v, w)        ## passes fine because names are ignored


x <- rep(1:12, 2)
y <- rep(0:1, 12)
res <- list(a=1:3, b=letters, LM=lm(y ~ x))
res2 <- list(a=seq(1,3,by=1), b=letters, LM=lm(y ~ x))
checkEquals( res, res2)        ## passes fine
checkIdentical( res, res)
checkIdentical( res2, res2)
## checkIdentical( res, res2)  ## fails because element 'a' differs in type


fun <- function(x) {
  if(x)
  {
   stop("stop conditions signaled")
  }
  return()
}

checkException(fun(TRUE))      ## passes fine
## checkException(fun(FALSE))  ## failure, because fun raises no error
checkException(fun(TRUE), silent=TRUE)

##  special constants
##  same behaviour as for underlying base functions
checkEquals(NA, NA)
checkEquals(NaN, NaN)
checkEquals(Inf, Inf)

checkIdentical(NA, NA)
checkIdentical(NaN, NaN)
checkIdentical(-Inf, -Inf)

## DEACTIVATED("here one can document on the reason for deactivation")



