library(PSAgraphics)


### Name: cv.bal.psa
### Title: Multiple Covariate Balance Assessment Plot
### Aliases: cv.bal.psa
### Keywords: hplot

### ** Examples

data(lindner)
attach(lindner)
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
ps<-lindner.ps$fitted
lindner.cv <- lindner[,4:10]
cv.bal.psa(lindner.cv, abcix, ps, strata = 5)
cv.bal.psa(lindner.cv, abcix, ps, strata = 10)
cv.bal.psa(lindner.cv, abcix, ps, int = c(.2, .5, .6, .75, .8))



