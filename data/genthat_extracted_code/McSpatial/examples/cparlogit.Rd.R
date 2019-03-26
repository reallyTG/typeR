library(McSpatial)


### Name: cparlogit
### Title: Conditionally Parametric logit for two or more choices
### Aliases: cparlogit
### Keywords: Discrete Choice Models Logit Conditionally Parametric
###   Nonparametric

### ** Examples

set.seed(5647)
data(cookdata)
cookdata <- cookdata[!is.na(cookdata$AGE),]
n = nrow(cookdata)
cookdata$ystar <- cookdata$DCBD - .5*cookdata$AGE
cookdata$y <- cookdata$ystar - mean(cookdata$ystar) + rnorm(n,sd=4) > 0

fit  <- cparlogit(y~DCBD+AGE,~LONGITUDE+LATITUDE,window=.5,
  distance="Latlong",data=cookdata,minp=0.001)



