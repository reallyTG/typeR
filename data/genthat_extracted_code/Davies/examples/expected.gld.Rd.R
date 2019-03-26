library(Davies)


### Name: expected.gld
### Title: expected value of the Generalized Lambda Distribution
### Aliases: expected.gld expected.gld.approx
### Keywords: distribution

### ** Examples

params <- c(4.114,0.1333,0.0193,0.1588)
mean(rgld(1000,params))
expected.gld(n=1,i=1,params)
expected.gld.approx(n=1,i=1,params)


f <- function(n){apply(matrix(rgld(n+n,params),2,n),2,min)}
#ie f(n) gives the smaller of 2 rgld RVs, n times.

mean(f(1000))
expected.gld(n=2,i=1,params)
expected.gld.approx(n=2,i=1,params)

plot(1:100,expected.gld.approx(n=100,i=1:100,params)-expected.gld(n=100,i=1:100,params))
# not bad, eh? ....yyyeeeeesss, but the parameters given by Ozturk give
# an almost zero second derivative for d(qgld)/dp, so the good agreement
# isn't surprising really.  Observe that the error is minimized at about
# p=0.2, where the point of inflection is.



