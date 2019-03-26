library(gmp)


### Name: is.whole
### Title: Whole ("Integer") Numbers
### Aliases: is.whole is.whole.default is.whole.bigz is.whole.bigq
### Keywords: math

### ** Examples

 is.integer(3) # FALSE, it's internally a double
 is.whole(3)   # TRUE
 ## integer valued complex numbers  (two FALSE) :
 is.whole(c(7, 1 + 1i, 1.2, 3.4i, 7i))
 is.whole(factorialZ(20)^(10:12)) ## "bigz" are *always* whole numbers
 q <- c(as.bigz(36)^50 / as.bigz(30)^40, 3, factorialZ(30:31), 12.25)
 is.whole(q) # F T T T F



