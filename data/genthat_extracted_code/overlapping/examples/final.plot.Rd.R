library(overlapping)


### Name: final.plot
### Title: Final plot
### Aliases: final.plot
### Keywords: utility

### ** Examples

set.seed(20150605)
x <- list(X1=rnorm(100),X2=rt(50,8),X3=rchisq(80,2))
out <- overlap(x)
final.plot(x,out$OV)



