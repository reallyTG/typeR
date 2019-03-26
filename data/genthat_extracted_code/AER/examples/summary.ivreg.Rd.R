library(AER)


### Name: summary.ivreg
### Title: Methods for Instrumental-Variable Regression
### Aliases: summary.ivreg print.summary.ivreg vcov.ivreg bread.ivreg
###   estfun.ivreg anova.ivreg hatvalues.ivreg predict.ivreg terms.ivreg
###   model.matrix.ivreg update.ivreg
### Keywords: regression

### ** Examples

## data
data("CigarettesSW")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

## model 
fm <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
  data = CigarettesSW, subset = year == "1995")
summary(fm)
summary(fm, vcov = sandwich, df = Inf, diagnostics = TRUE)

## ANOVA
fm2 <- ivreg(log(packs) ~ log(rprice) | tdiff, data = CigarettesSW, subset = year == "1995")
anova(fm, fm2, vcov = sandwich, test = "Chisq")



