library(supportInt)


### Name: lmLikSI
### Title: Profile support intervals for lm coefficients
### Aliases: lmLikSI
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(10)
x <- rnorm(50, 0 , 5)
y <- sapply(1:length(x), function(z) 3+.5*x[z]+rnorm(1, 0, 5))
lm.obj <- lm(y~x)
lmLikSI(lm.obj, 8)



