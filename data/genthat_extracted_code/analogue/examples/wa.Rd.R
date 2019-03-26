library(analogue)


### Name: wa
### Title: Weighted averaging transfer functions
### Aliases: wa wa.default wa.formula print.wa fitted.wa residuals.wa
###   coef.wa waFit
### Keywords: methods models regression multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
data(ImbrieKipp)
data(SumSST)

## fit the WA model
mod <- wa(SumSST ~., data = ImbrieKipp)
mod

## extract the fitted values
fitted(mod)

## residuals for the training set
residuals(mod)

## deshrinking coefficients
coef(mod)

## diagnostics plots
par(mfrow = c(1,2))
plot(mod)
par(mfrow = c(1,1))

## caterpillar plot of optima and tolerances
caterpillarPlot(mod)                 ## observed tolerances
caterpillarPlot(mod, type = "model") ## with tolerances used in WA model

## plot diagnostics for the WA model
par(mfrow = c(1,2))
plot(mod)
par(mfrow = c(1,1))

## tolerance DW
mod2 <- wa(SumSST ~ ., data = ImbrieKipp, tol.dw = TRUE,
           min.tol = 2, small.tol = "min")
mod2

## compare actual tolerances to working values
with(mod2, rbind(tolerances, model.tol))

## tolerance DW
mod3 <- wa(SumSST ~ ., data = ImbrieKipp, tol.dw = TRUE,
           min.tol = 2, small.tol = "mean")
mod3

## fit a WA model with monotonic deshrinking
mod4 <- wa(SumSST ~., data = ImbrieKipp, deshrink = "monotonic")
mod4

## extract the fitted values
fitted(mod4)

## residuals for the training set
residuals(mod4)

## Don't show: 
options(od)
## End(Don't show)



