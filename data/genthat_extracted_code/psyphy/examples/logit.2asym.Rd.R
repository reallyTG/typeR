library(psyphy)


### Name: logit.2asym
### Title: Links for Binomial Family with Variable Upper/Lower Asymptotes
### Aliases: logit.2asym probit.2asym cauchit.2asym cloglog.2asym
###   weib.2asym
### Keywords: models

### ** Examples

#A toy example,
b <- 3
g <- 0.05 # simulated false alarm rate
d <- 0.03
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

ddprob.glm <- psyfun.2asym(resp.mat ~ cnt, link = probit.2asym)
ddlog.glm <- psyfun.2asym(resp.mat ~ cnt, link = logit.2asym)
# Can fit a Weibull function, but use log contrast as variable
ddweib.glm <- psyfun.2asym(resp.mat ~ log(cnt), link = weib.2asym) 
ddcau.glm <- psyfun.2asym(resp.mat ~ cnt, link = cauchit.2asym)

plot(cnt, phat, log = "x", cex = 1.5, ylim = c(0, 1))
pcnt <- seq(0.01, 0.1, len = 100)
lines(pcnt, predict(ddprob.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 5)
lines(pcnt, predict(ddlog.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 2, lty = 2, col = "blue")
lines(pcnt, predict(ddweib.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 3, col = "grey")
lines(pcnt, predict(ddcau.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 3, col = "grey", lty = 2)




