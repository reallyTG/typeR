library(tscount)


### Name: campy
### Title: Campylobacter Infections Time Series
### Aliases: campy
### Keywords: Data

### ** Examples

plot(campy)

#Fit the INGARCH model used in Ferland et al. (2006):
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
summary(campyfit)
plot(campyfit)
#Note that these parameter estimations differ from those obtained by
#Ferland et al. (2006). This might be due to a different initialisation
#of pre-sample values and different optimisation algorithms (they use
#Microsoft Excel Solver Macro). 



