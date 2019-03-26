library(contfrac)


### Name: as_cf
### Title: Approximates a real number in continued fraction form
### Aliases: as_cf
### Keywords: math

### ** Examples

phi <- (sqrt(5)+1)/2
as_cf(phi,50)  # loses it after about 38 iterations ... not bad ...

as_cf(pi)  # looks about right
as_cf(exp(1),20)

f <- function(x){CF(as_cf(x,30),TRUE) - x}

x <- runif(40)
plot(sapply(x,f))





