library(Rmpfr)


### Name: is.whole
### Title: Whole ("Integer") Numbers
### Aliases: is.whole.mpfr
### Keywords: math

### ** Examples

 is.integer(3) # FALSE, it's internally a double
 is.whole(3)   # TRUE
 x <- c(as(2,"mpfr") ^ 100, 3, 3.2, 1000000, 2^40)
 is.whole(x) # one FALSE, only
## Don't show: 
xt <- c(x, as.bigz(2)^120, as.bigq(3,1:3))
stopifnot(identical(is.whole(x), (1:5)!=3), is(xt, "mpfr"),
          identical(is.whole(xt), is.na(match(1:9, c(3,8)))))
## End(Don't show)



