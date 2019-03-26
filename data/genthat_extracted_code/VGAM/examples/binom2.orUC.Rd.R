library(VGAM)


### Name: Binom2.or
### Title: Bivariate Binary Regression with an Odds Ratio
### Aliases: Binom2.or dbinom2.or rbinom2.or
### Keywords: distribution

### ** Examples

nn <- 1000  # Example 1
ymat <- rbinom2.or(nn, mu1 = logit(1, inv = TRUE), oratio = exp(2), exch = TRUE)
(mytab <- table(ymat[, 1], ymat[, 2], dnn = c("Y1", "Y2")))
(myor <- mytab["0","0"] * mytab["1","1"] / (mytab["1","0"] * mytab["0","1"]))
fit <- vglm(ymat ~ 1, binom2.or(exch = TRUE))
coef(fit, matrix = TRUE)

bdata <- data.frame(x2 = sort(runif(nn)))  # Example 2
bdata <- transform(bdata, mu1 = logit(-2 + 4 * x2, inverse = TRUE),
                          mu2 = logit(-1 + 3 * x2, inverse = TRUE))
dmat <- with(bdata, dbinom2.or(mu1 = mu1, mu2 = mu2, oratio = exp(2)))
ymat <- with(bdata, rbinom2.or(n = nn, mu1 = mu1, mu2 = mu2, oratio = exp(2)))
fit2 <- vglm(ymat ~ x2, binom2.or, data = bdata)
coef(fit2, matrix = TRUE)
## Not run: 
##D matplot(with(bdata, x2), dmat, lty = 1:4, col = 1:4, type = "l",
##D         main = "Joint probabilities", ylim = 0:1,
##D         ylab = "Probabilities", xlab = "x2", las = 1)
##D legend("top", lty = 1:4, col = 1:4,
##D        legend = c("1 = (y1=0, y2=0)", "2 = (y1=0, y2=1)",
##D                   "3 = (y1=1, y2=0)", "4 = (y1=1, y2=1)"))
## End(Not run)



