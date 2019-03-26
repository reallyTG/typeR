library(mppa)


### Name: mppa-package
### Title: Statistics for analysing multiple simultaneous point processes
###   on the real line
### Aliases: mppa-package mppa
### Keywords: package

### ** Examples

A = runif(20)
B=runif(20)
##around ten B events are caused by A 
B=c(B, sample(A, 10)+abs(rnorm(10, 0,.01))); B = B[B>0&B<1]
## Not run: plot(mp(list(A=A,B=B)))
corrtest(A,B)



