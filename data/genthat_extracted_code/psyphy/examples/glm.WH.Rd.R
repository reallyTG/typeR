library(psyphy)


### Name: glm.WH
### Title: mafc Probit Fit to Psychometric Function with Upper Asymptote
###   Less than One
### Aliases: glm.WH
### Keywords: models

### ** Examples

b <- 3.5
g <- 1/4
d <- 0.04
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

tst.glm <- glm(resp.mat ~ cnt, binomial(mafc.probit(1/g)))
pcnt <- seq(0.005, 1, len = 1000)
plot(cnt, phat, log = "x", ylim = c(0, 1), xlim = c(0.005, 1),
	cex = 1.75)
lines(pcnt, predict(tst.glm, data.frame(cnt = pcnt), type = "response"), lwd = 2)
tst.lam <- glm.WH(resp.mat ~ cnt, NumAlt = 1/g, trace = TRUE)
lines(pcnt, predict(tst.lam, data.frame(cnt = pcnt), 
	type = "response"), lty = 2, lwd = 2)




