library(VGAM)


### Name: smartpred
### Title: Smart Prediction
### Aliases: smartpred sm.bs sm.ns sm.scale sm.scale.default sm.poly
### Keywords: models regression programming

### ** Examples

# Create some data first
n <- 20
set.seed(86)  # For reproducibility of the random numbers
ldata <- data.frame(x2 = sort(runif(n)), y = sort(runif(n)))
library("splines")  # To get ns() in R

# This will work for R 1.6.0 and later
fit <- lm(y ~ ns(x2, df = 5), data = ldata)
## Not run: 
##D plot(y ~ x2, data = ldata)
##D lines(fitted(fit) ~ x2, data = ldata)
##D new.ldata <- data.frame(x2 = seq(0, 1, len = n))
##D points(predict(fit, new.ldata) ~ x2, new.ldata, type = "b", col = 2, err = -1)
## End(Not run)

# The following fails for R 1.6.x and later. It can be
# made to work with smart prediction provided
# ns is changed to sm.ns and scale is changed to sm.scale:
fit1 <- lm(y ~ ns(scale(x2), df = 5), data = ldata)
## Not run: 
##D plot(y ~ x2, data = ldata, main = "Safe prediction fails")
##D lines(fitted(fit1) ~ x2, data = ldata)
##D points(predict(fit1, new.ldata) ~ x2, new.ldata, type = "b", col = 2, err = -1)
## End(Not run)

# Fit the above using smart prediction
## Not run: 
##D library("VGAM")  # The following requires the VGAM package to be loaded 
##D fit2 <- vglm(y ~ sm.ns(sm.scale(x2), df = 5), uninormal, data = ldata)
##D fit2@smart.prediction
##D plot(y ~ x2, data = ldata, main = "Smart prediction")
##D lines(fitted(fit2) ~ x2, data = ldata)
##D points(predict(fit2, new.ldata, type = "response") ~ x2, data = new.ldata,
##D        type = "b", col = 2, err = -1)
## End(Not run)



