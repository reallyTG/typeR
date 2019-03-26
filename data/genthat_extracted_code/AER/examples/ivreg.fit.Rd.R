library(AER)


### Name: ivreg.fit
### Title: Fitting Instrumental-Variable Regressions
### Aliases: ivreg.fit
### Keywords: regression

### ** Examples

## data
data("CigarettesSW")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

## high-level interface
fm <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
  data = CigarettesSW, subset = year == "1995")

## low-level interface
y <- fm$y
x <- model.matrix(fm, component = "regressors")
z <- model.matrix(fm, component = "instruments")
ivreg.fit(x, y, z)$coefficients



