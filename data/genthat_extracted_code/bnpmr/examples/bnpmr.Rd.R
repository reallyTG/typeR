library(bnpmr)


### Name: bnpmr
### Title: Monotonic regression
### Aliases: bnpmr
### Keywords: models

### ** Examples

########################################################################
## example 1
## generate some example data
x <- seq(0,1,length=100) 
y <- 2+3*x/(0.05+x)+rnorm(100, 0, 1)
## run bnpmr function (with "default" parameters and priors)
res <- bnpmr(y, x)
sq <- seq(0,1,length=101)
aa <- pred.bnpmr(sq, res)
out005 <- apply(aa, 2, quantile, prob = 0.05)
out050 <- apply(aa, 2, median)
out095 <- apply(aa, 2, quantile, prob = 0.95)
## plot result
plot(x,y)
lines(sq, out005)
lines(sq, out050)
lines(sq, out095)
curve(2+3*x/(x+0.05), add=TRUE, col=2)

########################################################################
## example 2 with a sparse dose-design
## closer to what we actually see in pharmaceutical dose-finding trials
x <- rep(c(0,0.05,0.2,0.6,1), each = 10)
y <- 2+3*x^5/(0.05^5+x^5)+rnorm(length(x), 0, 1)

res <- bnpmr(y, x)
sq <- seq(0,1,length=101)
aa <- pred.bnpmr(sq, res)
out005 <- apply(aa, 2, quantile, prob = 0.05)
out050 <- apply(aa, 2, median)
out095 <- apply(aa, 2, quantile, prob = 0.95)

plot(x,y, ylim = c(0,8))
lines(sq, out005)
lines(sq, out050)
lines(sq, out095)
curve(2+3*x^5/(x^5+0.05^5), add=TRUE, col=2)

#### now reanalyse using different prior
## use prior that says placebo response = 0 with small uncertainty
## (just to check code)
V <- matrix(c(0.01,0,0,10), nrow=2)
prior <- list(alpha = 1, lambda = 0.5, m = c(0, 1), V=V, a=3.6, d=4, la=1,lb=2)
res2 <- bnpmr(y, x, prior = prior)
aa <- pred.bnpmr(sq, res2)
out005 <- apply(aa, 2, quantile, prob = 0.05)
out050 <- apply(aa, 2, median)
out095 <- apply(aa, 2, quantile, prob = 0.95)
lines(sq, out005, col = "green")
lines(sq, out050, col = "green")
lines(sq, out095, col = "green")




