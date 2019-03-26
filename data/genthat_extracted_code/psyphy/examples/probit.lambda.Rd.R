library(psyphy)


### Name: probit.lambda
### Title: mafc Probit Link for Binomial Family with Upper Asymptote < 1
### Aliases: probit.lambda
### Keywords: models

### ** Examples

b <- 3.5
g <- 1/3
d <- 0.025
a <- 0.04
p <- c(a, b, g, d)
num.tr <- 160
cnt <- 10^seq(-2, -1, length = 6) # contrast levels

#simulated Weibull-Quick observer responses
truep <- g + (1 - g - d) * pweibull(cnt, b, a)
ny <- rbinom(length(cnt), num.tr, truep)
nn <- num.tr - ny
phat <- ny/(ny + nn)
resp.mat <- matrix(c(ny, nn), ncol = 2)

ddprob.glm <- glm(resp.mat ~ cnt, family = binomial(mafc.probit(3)))
ddprob.lam <- glm(resp.mat ~ cnt, family = binomial(probit.lambda(3, 0.025)))
AIC(ddprob.glm, ddprob.lam)

plot(cnt, phat, log = "x", cex = 1.5, ylim = c(0, 1))
pcnt <- seq(0.01, 0.1, len = 100)
lines(pcnt, predict(ddprob.glm, data.frame(cnt = pcnt),
                        type = "response"), lwd = 2)
lines(pcnt, predict(ddprob.lam, data.frame(cnt = pcnt),
                        type = "response"), lwd = 2, lty = 2)



