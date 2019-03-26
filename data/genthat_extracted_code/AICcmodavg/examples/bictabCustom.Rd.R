library(AICcmodavg)


### Name: bictabCustom
### Title: Custom Creation of Model Selection Tables from User-supplied
###   Input Based on (Q)BIC
### Aliases: bictabCustom
### Keywords: models

### ** Examples

##vector with model LL's
LL <- c(-38.8876, -35.1783, -64.8970)

##vector with number of parameters
Ks <- c(7, 9, 4)

##create a vector of names to trace back models in set
Modnames <- c("Cm1", "Cm2", "Cm3")

##generate BIC table
bictabCustom(logL = LL, K = Ks, modnames = Modnames, nobs = 121,
             sort = TRUE)



