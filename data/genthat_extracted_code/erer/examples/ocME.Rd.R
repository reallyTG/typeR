library(erer)


### Name: ocME
### Title: Marginal Effect for Ordered Choice Model
### Aliases: ocME print.ocME
### Keywords: regression

### ** Examples

# Loading data from the MASS library
library(MASS)
data(housing) 
str(housing); head(housing)

# Fit an ordered choice model with polr from the MASS library
# This is the original specification used in MASS.
fm <- Sat ~ Infl + Type + Cont
ra <- polr(fm, data = housing, weights = Freq, Hess = TRUE, method = "probit")
rb <- polr(fm, data = housing, weights = Freq, Hess = TRUE, method = "logistic")
summary(ra); summary(rb)

# Compute the marginal effect
mea <- ocME(w = ra); mea
meb <- ocME(w = rb); meb
meb$out



