library(POT)


### Name: fitbvgpd
### Title: Fitting Bivariate Peaks Over a Threshold Using Bivariate Extreme
###   Value Distributions
### Aliases: fitbvgpd
### Keywords: models

### ** Examples

x <- rgpd(1000, 0, 1, 0.25)
y <- rgpd(1000, 3, 1, -0.25)
ind <- fitbvgpd(cbind(x, y), c(0, 3), "log")
ind
ind2 <- fitbvgpd(cbind(x, y), c(0, 3), "log", alpha = 1)
ind2
ind3 <- fitbvgpd(cbind(x, y), c(0, 3), cscale = TRUE)
ind3
##The mixed model can not deal with perfect dependent variables
##Thus, there is a substantial bias in GPD parameter estimates
dep <- fitbvgpd(cbind(x, x + 3), c(0, 3), "mix")
dep



