library(spData)


### Name: boston
### Title: Corrected Boston Housing Data
### Aliases: boston boston.c boston.soi boston.utm
### Keywords: datasets spdep

### ** Examples

if (requireNamespace("spdep", quietly = TRUE)) {
  library(spdep)
  data(boston)
  hr0 <- lm(log(MEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
                    AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data=boston.c)
  summary(hr0)
  logLik(hr0)
  gp0 <- lm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
                    AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data=boston.c)
  summary(gp0)
  logLik(gp0)
  lm.morantest(hr0, nb2listw(boston.soi))
}
## Not run: 
##D library(rgdal)
##D boston.tr <- readOGR(system.file("shapes/boston_tracts.shp",
##D                            package="spData")[1])
##D boston_nb <- poly2nb(boston.tr)
## End(Not run)
## Not run: 
##D gp1 <- errorsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2)
##D                            + I(RM^2) +  AGE + log(DIS) + log(RAD) +
##D                             TAX + PTRATIO + B + log(LSTAT),
##D                            data=boston.c, nb2listw(boston.soi), method="Matrix", 
##D                            control=list(tol.opt = .Machine$double.eps^(1/4)))
##D summary(gp1)
##D gp2 <- lagsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2)
##D                 +  AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT),
##D                 data=boston.c, nb2listw(boston.soi), method="Matrix")
##D summary(gp2)
## End(Not run)



