library(PDQutils)


### Name: AS269
### Title: Higher order Cornish Fisher approximation.
### Aliases: AS269
### Keywords: distribution

### ** Examples

foo <- AS269(seq(-2,2,0.01),c(0,2,0,4))
# test with the normal distribution:
s.cumul <- c(0,0,0,0,0,0,0,0,0)
pv <- seq(0.001,0.999,0.001)
zv <- qnorm(pv)
apq <- AS269(zv,s.cumul,all.ords=FALSE)
err <- zv - apq

# test with the exponential distribution
rate <- 0.7
n <- 18
# these are 'raw' cumulants'
cumul <- (rate ^ -(1:n)) * factorial(0:(n-1))
# standardize and chop
s.cumul <- cumul[3:length(cumul)] / (cumul[2]^((3:length(cumul))/2))
pv <- seq(0.001,0.999,0.001)
zv <- qnorm(pv)
apq <- cumul[1] + sqrt(cumul[2]) * AS269(zv,s.cumul,all.ords=TRUE)
truq <- qexp(pv, rate=rate)
err <- truq - apq
colSums(abs(err))

# an example from Wikipedia page on CF, 
# \url{https://en.wikipedia.org/wiki/Cornish%E2%80%93Fisher_expansion}
s.cumul <- c(5,2)
apq <- 10 + sqrt(25) * AS269(qnorm(0.95),s.cumul,all.ords=TRUE)




