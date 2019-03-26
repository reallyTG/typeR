library(VAR.etp)


### Name: VAR.Fore
### Title: VAR Forecasting
### Aliases: VAR.Fore
### Keywords: ts

### ** Examples

#replicating Section 3.5.3 of Lutkepohl (2005)
data(dat)
b=VAR.est(dat,p=2,type="const")$coef
VAR.Fore(dat,b,p=2,h=10,type="const")



