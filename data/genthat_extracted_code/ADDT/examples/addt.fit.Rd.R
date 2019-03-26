library(ADDT)


### Name: addt.fit
### Title: ADDT Model Fitting
### Aliases: addt.fit

### ** Examples

data(AdhesiveBondB)

## Least Squares
addt.fit.lsa<-addt.fit(Response~TimeH+TempC,data=AdhesiveBondB,proc="LS",
failure.threshold=70)

## Maximum Likelihood
addt.fit.mla<-addt.fit(Response~TimeH+TempC,data=AdhesiveBondB,proc="ML",
failure.threshold=70)

## Semiparametric
## Not run: 
##D addt.fit.semi<-addt.fit(Response~TimeH+TempC,data=AdhesiveBondB,proc="SemiPara",
##D failure.threshold=70)
## End(Not run)

## All LS, ML and Semi-Parametric procedures
## Not run: 
##D addt.fit.all<-addt.fit(Response~TimeH+TempC,data=AdhesiveBondB,proc="All",
##D failure.threshold=70)
## End(Not run)

summary(addt.fit.lsa)
summary(addt.fit.mla)
## Not run: summary(addt.fit.semi)
## Not run: summary(addt.fit.all)

## Not run: plot(addt.fit.all, type="data")
## Not run: plot(addt.fit.all, type="LS")
## Not run: plot(addt.fit.all, type="ML")
## Not run: plot(addt.fit.semi, type="SEMI")

## Not run: addt.confint.ti.mle(addt.fit.mla,conflevel=0.95)



