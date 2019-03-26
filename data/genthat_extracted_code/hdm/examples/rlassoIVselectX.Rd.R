library(hdm)


### Name: rlassoIVselectX
### Title: Instrumental Variable Estimation with Selection on the exogenous
###   Variables by Lasso
### Aliases: rlassoIVselectX rlassoIVselectX.default
###   rlassoIVselectX.formula

### ** Examples

library(hdm)
data(AJR); y = AJR$GDP; d = AJR$Exprop; z = AJR$logMort
x = model.matrix(~ -1 + (Latitude + Latitude2 + Africa + 
                           Asia + Namer + Samer)^2, data=AJR)
dim(x)
  #AJR.Xselect = rlassoIV(x=x, d=d, y=y, z=z, select.X=TRUE, select.Z=FALSE)
  AJR.Xselect = rlassoIV(GDP ~ Exprop +  (Latitude + Latitude2 + Africa + Asia + Namer + Samer)^2 |
             logMort +  (Latitude + Latitude2 + Africa + Asia + Namer + Samer)^2,
             data=AJR, select.X=TRUE, select.Z=FALSE)
summary(AJR.Xselect)
confint(AJR.Xselect)



