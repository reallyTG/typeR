library(McSpatial)


### Name: qregsim1 
### Title: Changes in Distributions Implied by Quantile Regression
###   Estimates
### Aliases: 'qregsim1 '
### Keywords: Quantile Regression Machado-Mata

### ** Examples


par(ask=TRUE)
data(matchdata)
matchdata$age <- matchdata$year - matchdata$yrbuilt 
tvect <- seq(.10,.90,.10)
bmat <- qregbmat(lnprice~lnland+lnbldg+age+factor(year), data=matchdata,
  graph.factor=TRUE,taumat=tvect,graphb=FALSE)

xvect <- signif(quantile(matchdata$lnland,c(.25,.75)),4)
fit <- qregsim1(lnprice~lnland+lnbldg+age+factor(year),~lnland, bmat, 
  tvect,xvalues=xvect,data=matchdata)
#Simulation for 1995
smalldata <- matchdata[matchdata$year==1995,]
bmat95 <- bmat[,1:4]
fit <- qregsim1(lnprice~lnland+lnbldg+age,~lnland,bmat95,tvect, 
  xvalues=xvect, data=smalldata)
#Simulation for 2005
smalldata <- matchdata[matchdata$year==2005,]
bmat05 <- bmat[,1:4]
bmat05[,1] <- bmat05[,1] + bmat[,5]
fit <- qregsim1(lnprice~lnland+lnbldg+age,~lnland,bmat05,tvect, 
  xvalues=xvect, data=smalldata)




