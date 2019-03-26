library(spData)


### Name: used.cars
### Title: US 1960 used car prices
### Aliases: used.cars usa48.nb
### Keywords: datasets spdep

### ** Examples

if (requireNamespace("spdep", quietly = TRUE)) {
  library(spdep)
  data(used.cars)
  moran.test(used.cars$price.1960, nb2listw(usa48.nb))
  moran.plot(used.cars$price.1960, nb2listw(usa48.nb),
           labels=rownames(used.cars))
  uc.lm <- lm(price.1960 ~ tax.charges, data=used.cars)
  summary(uc.lm)

  lm.morantest(uc.lm, nb2listw(usa48.nb))
  lm.morantest.sad(uc.lm, nb2listw(usa48.nb))
  lm.LMtests(uc.lm, nb2listw(usa48.nb))
  uc.err <- errorsarlm(price.1960 ~ tax.charges, data=used.cars,
                     nb2listw(usa48.nb), tol.solve=1.0e-13, 
                     control=list(tol.opt=.Machine$double.eps^0.3))
  summary(uc.err)
  uc.lag <- lagsarlm(price.1960 ~ tax.charges, data=used.cars,
                   nb2listw(usa48.nb), tol.solve=1.0e-13, 
                   control=list(tol.opt=.Machine$double.eps^0.3))
  summary(uc.lag)
  uc.lag1 <- lagsarlm(price.1960 ~ 1, data=used.cars,
                    nb2listw(usa48.nb), tol.solve=1.0e-13, 
                    control=list(tol.opt=.Machine$double.eps^0.3))
  summary(uc.lag1)
  uc.err1 <- errorsarlm(price.1960 ~ 1, data=used.cars,
                      nb2listw(usa48.nb), tol.solve=1.0e-13, 
                      control=list(tol.opt=.Machine$double.eps^0.3))
  summary(uc.err1)
}



