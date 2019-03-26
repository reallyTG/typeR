library(McSpatial)


### Name: cparprobit
### Title: Conditionally Parametric probit for two choices
### Aliases: cparprobit
### Keywords: Discrete Choice Models Probit Conditionally Parametric
###   Nonparametric

### ** Examples

set.seed(5647)
data(cookdata)
cookdata <- cookdata[!is.na(cookdata$AGE),]
n = nrow(cookdata)
cookdata$ystar <- cookdata$DCBD - .5*cookdata$AGE
cookdata$y <- cookdata$ystar - mean(cookdata$ystar) + rnorm(n,sd=4) > 0

tvect <- maketarget(~LONGITUDE+LATITUDE,window=.5,data=cookdata)$target
fit  <- cparprobit(y~DCBD+AGE,~LONGITUDE+LATITUDE,window=.5,
  target=tvect,distance="Latlong",data=cookdata,minp=0.001)



