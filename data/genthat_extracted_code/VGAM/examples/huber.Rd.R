library(VGAM)


### Name: huber2
### Title: Huber's Least Favourable Distribution Family Function
### Aliases: huber2 huber1
### Keywords: models regression

### ** Examples

set.seed(1231); NN <- 30; coef1 <- 1; coef2 <- 10
hdata <- data.frame(x2 = sort(runif(NN)))
hdata <- transform(hdata, y  = rhuber(NN, mu = coef1 + coef2 * x2))

hdata$x2[1] <- 0.0  # Add an outlier
hdata$y[1] <- 10

fit.huber2 <- vglm(y ~ x2, huber2(imethod = 3), data = hdata, trace = TRUE)
fit.huber1 <- vglm(y ~ x2, huber1(imethod = 3), data = hdata, trace = TRUE)

coef(fit.huber2, matrix = TRUE)
summary(fit.huber2)


## Not run: 
##D  # Plot the results
##D plot(y ~ x2, data = hdata, col = "blue", las = 1)
##D lines(fitted(fit.huber2) ~ x2, data = hdata, col = "darkgreen", lwd = 2)
##D 
##D fit.lm <- lm(y ~ x2, hdata)  # Compare to a LM:
##D lines(fitted(fit.lm) ~ x2, data = hdata, col = "lavender", lwd = 3)
##D 
##D # Compare to truth:
##D lines(coef1 + coef2 * x2 ~ x2, data = hdata, col = "orange", lwd = 2, lty = "dashed")
##D 
##D legend("bottomright", legend = c("truth", "huber", "lm"),
##D        col = c("orange", "darkgreen", "lavender"),
##D        lty = c("dashed", "solid", "solid"), lwd = c(2, 2, 3)) 
## End(Not run)



