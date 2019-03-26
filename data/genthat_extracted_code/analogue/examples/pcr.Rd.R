library(analogue)


### Name: pcr
### Title: Prinicpal component regression transfer function models
### Aliases: pcr pcr.default pcr.formula print.pcr Hellinger ChiSquare
###   performance.pcr fitted.pcr coef.pcr residuals.pcr screeplot.pcr
###   eigenvals.pcr
### Keywords: methods

### ** Examples

## Load the Imbrie & Kipp data and
## summer sea-surface temperatures
data(ImbrieKipp)
data(SumSST)

## normal interface and apply Hellinger transformation
mod <- pcr(ImbrieKipp, SumSST, tranFun = Hellinger)
mod

## formula interface, but as above
mod2 <- pcr(SumSST ~ ., data = ImbrieKipp, tranFun = Hellinger)
mod2

## Several standard methods are available
fitted(mod, comps = 1:4)
resid(mod, comps = 1:4)
coef(mod, comps = 1:4)

## Eigenvalues can be extracted
eigenvals(mod)

## screeplot method
screeplot(mod)



