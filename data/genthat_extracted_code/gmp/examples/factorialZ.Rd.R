library(gmp)


### Name: factorialZ
### Title: Factorial and Binomial Coefficient as Big Integer
### Aliases: factorialZ chooseZ
### Keywords: arith

### ** Examples

factorialZ(0:10)# 1 1 2 6 ... 3628800
factorialZ(0:40)# larger
factorialZ(200)

n <- 1000
f1000 <- factorialZ(n)
stopifnot(1e-15 > abs(as.numeric(1 - lfactorial(n)/log(f1000))))

system.time(replicate(8, f1e4 <<- factorialZ(10000)))
nchar(as.character(f1e4))# 35660 ... (too many to even look at ..)

chooseZ(1000, 100:102)# vectorizes
chooseZ(as.bigz(2)^120, 10)
n <- c(50,80,100)
k <- c(20,30,40)
## currently with an undesirable warning: % from methods/src/eval.c  _FIXME_
stopifnot(chooseZ(n,k) == factorialZ(n) / (factorialZ(k)*factorialZ(n-k)))



