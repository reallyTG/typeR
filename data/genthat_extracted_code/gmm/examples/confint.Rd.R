library(gmm)


### Name: confint
### Title: Confidence intervals for GMM or GEL
### Aliases: confint.gel confint.ategel confint.gmm print.confint

### ** Examples

#################
n = 500
phi<-c(.2,.7)
thet <- 0
sd <- .2
x <- matrix(arima.sim(n = n, list(order = c(2,0,1), ar = phi, ma = thet, sd = sd)), ncol = 1)
y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]

H <- cbind(x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
g <- y ~ ym1 + ym2
x <- H
t0 <- c(0,.5,.5)

resGel <- gel(g, x, t0)

confint(resGel)
confint(resGel, level = 0.90)
confint(resGel, lambda = TRUE)

########################

resGmm <- gmm(g, x)

confint(resGmm)
confint(resGmm, level = 0.90)

## Confidence interval with inversion of the LR, LM or J test.
##############################################################

set.seed(112233)
x <- rt(40, 3)
y <- x+rt(40,3)
# Simple interval on the mean
res <- gel(x~1, ~1, method="Brent", lower=-4, upper=4)
confint(res, type = "invLR")
confint(res)
# Using a Bartlett correction
k <- mean((x-mean(x))^4)/sd(x)^4
s <- mean((x-mean(x))^3)/sd(x)^3
a <- k/2-s^2/3
corr <- 1+a/40
confint(res, type = "invLR", corr=corr)

# Interval on the slope
res <- gel(y~x, ~x)
confint(res, "x", type="invLR")
confint(res, "x")



