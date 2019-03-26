library(VGAM)


### Name: Binom2.rho
### Title: Bivariate Probit Model
### Aliases: Binom2.rho dbinom2.rho rbinom2.rho
### Keywords: distribution

### ** Examples

(myrho <- rhobit(2, inverse = TRUE))  # Example 1
ymat <- rbinom2.rho(nn <- 2000, mu1 = 0.8, rho = myrho, exch = TRUE)
(mytab <- table(ymat[, 1], ymat[, 2], dnn = c("Y1", "Y2")))
fit <- vglm(ymat ~ 1, binom2.rho(exch = TRUE))
coef(fit, matrix = TRUE)

bdata <- data.frame(x2 = sort(runif(nn)))  # Example 2
bdata <- transform(bdata, mu1 = probit(-2+4*x2, inverse = TRUE),
                          mu2 = probit(-1+3*x2, inverse = TRUE))
dmat <- with(bdata, dbinom2.rho(mu1, mu2, myrho))
ymat <- with(bdata, rbinom2.rho(nn, mu1, mu2, myrho))
fit2 <- vglm(ymat ~ x2, binom2.rho, data = bdata)
coef(fit2, matrix = TRUE)
## Not run: 
##D  matplot(with(bdata, x2), dmat, lty = 1:4, col = 1:4,
##D         type = "l", main = "Joint probabilities",
##D         ylim = 0:1, lwd = 2, ylab = "Probability")
##D legend(x = 0.25, y = 0.9, lty = 1:4, col = 1:4, lwd = 2,
##D        legend = c("1 = (y1=0, y2=0)", "2 = (y1=0, y2=1)",
##D                   "3 = (y1=1, y2=0)", "4 = (y1=1, y2=1)")) 
## End(Not run)



