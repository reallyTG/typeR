library(psyphy)


### Name: mafc
### Title: Links for Binomial Family for m-alternative Forced-choice
### Aliases: mafc mafc.logit mafc.probit mafc.cloglog mafc.weib
###   mafc.cauchit
### Keywords: models

### ** Examples

#A toy example,
b <- 3.5
g <- 1/3
d <- 0.0
a <- 0.04
p <- c(a, b, g, d)
num.tr <- 160
cnt <- 10^seq(-2, -1, length = 6) # contrast levels

#simulated observer responses
truep <- g + (1 - g - d) * pweibull(cnt, b, a)
ny <- rbinom(length(cnt), num.tr, truep)
nn <- num.tr - ny
phat <- ny/(ny + nn)
resp.mat <- matrix(c(ny, nn), ncol = 2)

ddprob.glm <- glm(resp.mat ~ cnt, family = binomial(mafc.probit(3)))
ddlog.glm <- glm(resp.mat ~ cnt, family = binomial(mafc.logit(3)))
# Can fit a Weibull function, but use log contrast as variable
ddweib.glm <- glm(resp.mat ~ log(cnt), family = binomial(mafc.cloglog(3))) 
ddcau.glm <- glm(resp.mat ~ log(cnt), family = binomial(mafc.cauchit(3)))

plot(cnt, phat, log = "x", cex = 1.5, ylim = c(0, 1))
pcnt <- seq(0.01, 0.1, len = 100)
lines(pcnt, predict(ddprob.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 2)
lines(pcnt, predict(ddlog.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 2, lty = 2)
lines(pcnt, predict(ddweib.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 3, col = "grey")
lines(pcnt, predict(ddcau.glm, data.frame(cnt = pcnt),
			type = "response"), lwd = 3, col = "grey", lty = 2)

# Weibull parameters \alpha and \beta
cc <- coef(ddweib.glm)
alph <- exp(-cc[1]/cc[2])
bet <- cc[2]


#More interesting example with data from Yssaad-Fesselier and Knoblauch
data(ecc2)
ecc2.glm <- glm(cbind(Correct, Incorrect) ~ Contr * Size * task, 
			family = binomial(mafc.probit(4)), data = ecc2)
summary(ecc2.glm)
ecc2$fit <- fitted(ecc2.glm)
library(lattice)
xyplot(Correct/(Correct + Incorrect) ~ Contr | Size * task, data = ecc2,
	subscripts = TRUE, ID = with(ecc2, Size + as.numeric(task)),
	scale = list(x = list(log = TRUE), 
				 y = list(limits = c(0, 1.05))),
	xlab = "Contrast", ylab = "Proportion Correct Response",
	aspect = "xy",
	panel = function(x, y, subscripts, ID, ...) {
		which = unique(ID[subscripts])
		llines(x, ecc2$fit[which ==ID], col = "black", ...)
		panel.xyplot(x, y, pch = 16, ...)
		panel.abline(h = 0.25, lty = 2, ...)
		}
)




