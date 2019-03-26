library(nproc)


### Name: compare
### Title: Compare two NP classification methods at different type I error
###   upper bounds.
### Aliases: compare

### ** Examples

n = 1000
set.seed(1)
x1 = c(rnorm(n), rnorm(n) + 1)
x2 = c(rnorm(n), rnorm(n)*sqrt(6) + 1)
y = c(rep(0,n), rep(1,n))
fit1 = nproc(x1, y, method = 'lda')
fit2 = nproc(x2, y, method = 'lda')
v = compare(fit1, fit2)
legend('topleft',legend=c('x1','x2'),col=1:2,lty=c(1,1))




