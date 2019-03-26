library(gmp)


### Name: modulus
### Title: Modulus of a Big Integer
### Aliases: modulus modulus<- modulus.bigz modulus<-.bigz
### Keywords: arith

### ** Examples

x <- as.bigz(24)
modulus(x) # NULL, i.e. none

# x element of Z/31Z :
modulus(x) <- 31
x+x  #  48 |-> (17 %% 31)
10*x # 240 |-> (23 %% 31)
x31 <- x

# reset modulus to "none":
modulus(x) <- NA; x; x. <- x
x <- x31
modulus(x) <- NULL; x

stopifnot(identical(x,            as.bigz(24)), identical(x, x.),
          identical(modulus(x31), as.bigz(31)))



