library(nlme)


### Name: gls
### Title: Fit Linear Model Using Generalized Least Squares
### Aliases: gls update.gls
### Keywords: models

### ** Examples

# AR(1) errors within each Mare
fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
# variance increases as a power of the absolute fitted values
fm2 <- update(fm1, weights = varPower())



