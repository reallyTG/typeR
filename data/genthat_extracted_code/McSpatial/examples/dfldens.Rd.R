library(McSpatial)


### Name: dfldens 
### Title: Counterfactual Kernel Density Functions
### Aliases: 'dfldens '
### Keywords: Nonparametric DiNardo-Levinsohn-McCrary

### ** Examples

data(matchdata)
matchdata$year05 <- matchdata$year==2005
fit <- dfldens(matchdata$lnprice, year05~lnland+lnbldg, window=.2, 
  yname = "Log of Sale Price", data=matchdata)
matchdata$age <- matchdata$year - matchdata$yrbuilt
fit <- dfldens(matchdata$lnprice, year05~age, window=.2, 
  yname="Log of Sale Price", data=matchdata)




