library(Qtools)


### Name: maref.rqt
### Title: Marginal Effects
### Aliases: maref maref.rq.counts maref.rqt
### Keywords: coefficients

### ** Examples

## Not run: 
##D # Box-Cox quantile regression model (dataset trees from package 'datasets')
##D fit <- tsrq(Volume ~ Height, data = trees, tsf = "bc", tau = 0.9)
##D 
##D # Coefficients (transformed scale)
##D coef(fit)
##D 
##D # Design matrix
##D head(fit$x)
##D 
##D # Marginal effect of 'Height'
##D maref(fit, namevec = "Height")
##D 
##D # Predict marginal effects over grid of values for Height
##D nd <- data.frame(Height = seq(min(trees$Height), max(trees$Height), length = 100))
##D x <- predict(fit, newdata = nd, type = "maref", namevec = "Height")
##D 
##D # Plot
##D plot(nd$Height, x, xlab = "Height", ylab = "Marginal effect on volume")
##D 
##D # Include 'Girth' and interaction between 'Height' and 'Girth'
##D fit <- tsrq(Volume ~ Height * Girth, data = trees, tsf = "bc", tau = 0.5)
##D head(fit$x)
##D 
##D # Predict marginal effects over grid of values for Height (for fixed girth)
##D nd$Girth <- rep(mean(trees$Girth), 100)
##D x <- predict(fit, newdata = nd, type = "maref", namevec = "Height")
##D plot(nd$Height, x, xlab = "Height", ylab = "Marginal effect on volume")
##D 
##D # Quantile regression for counts (log transformation)
##D data(esterase)
##D fit <- rq.counts(Count ~ Esterase, tau = 0.25, data = esterase, M = 50)
##D maref(fit, namevec = "Esterase")
## End(Not run)



