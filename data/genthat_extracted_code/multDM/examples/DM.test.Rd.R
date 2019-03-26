library(multDM)


### Name: DM.test
### Title: Computes Diebold-Mariano Test for the Equal Predictive Accuracy.
### Aliases: DM.test

### ** Examples

data(MDMforecasts)
ts <- MDMforecasts$ts
forecasts <- MDMforecasts$forecasts
DM.test(f1=forecasts[,1],f2=forecasts[,2],y=ts,loss="SE",h=1,c=FALSE,H1="same")



