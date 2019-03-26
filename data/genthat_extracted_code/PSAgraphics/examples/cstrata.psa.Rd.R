library(PSAgraphics)


### Name: cstrata.psa
### Title: Supports Multiple Methods for Defining and Visualizing (PS)
###   Strata
### Aliases: cstrata.psa
### Keywords: hplot

### ** Examples

data(lindner)
attach(lindner)
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
ps <- lindner.ps$fitted
cstrata.psa(abcix, ps, strata = 5)	
cstrata.psa(abcix, ps, strata = 10)
cstrata.psa(abcix, ps, int = c(.37, .56, .87, 1))



