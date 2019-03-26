library(psyphy)


### Name: glm.lambda
### Title: mafc Probit Fit to Psychometric Function Profiled on Upper
###   Asymptote
### Aliases: glm.lambda
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
set.seed(12161952)
truep <- g + (1 - g - d) * pweibull(cnt, b, a)
ny <- rbinom(length(cnt), num.tr, truep)
nn <- num.tr - ny
phat <- ny/(ny + nn)
resp.mat <- matrix(c(ny, nn), ncol = 2)

## First with upper asymptote at 1
dd.glm <- glm(resp.mat ~ cnt, family = binomial(mafc.probit(3)))
summary(dd.glm)
dd.lam <- glm.lambda(resp.mat ~ cnt, NumAlt = 3, lambda = seq(0, 0.03, 
	len = 100), plot.it = TRUE)
summary(dd.lam)
## can refine interval, but doesn't change result much
dd.lam2 <- glm.lambda(resp.mat ~ cnt, NumAlt = 3, 
	lambda = seq(dd.lam$lambda/sqrt(2), dd.lam$lambda*sqrt(2), 
	len = 100), plot.it = TRUE)
summary(dd.lam2)
## Compare fits w/ and w/out lambda
anova(dd.glm, dd.lam2, test = "Chisq")

plot(cnt, phat, log = "x", cex = 1.5, ylim = c(0, 1))
pcnt <- seq(0.01, 0.1, len = 100)
lines(pcnt, predict(dd.glm, data.frame(cnt = pcnt),
                    type = "response"), lwd = 2)
lines(pcnt, predict(dd.lam, data.frame(cnt = pcnt),
                    type = "response"), lwd = 2, lty = 2)




