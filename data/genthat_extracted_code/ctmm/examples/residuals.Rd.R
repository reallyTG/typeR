library(ctmm)


### Name: residuals.ctmm
### Title: Calculate model fit residuals and assess their autocorrelation
### Aliases: residuals.ctmm residuals.telemetry correlogram

### ** Examples
## No test: 
#Load package and data
library(ctmm)
data(buffalo)
Cilla <- buffalo$Cilla

#fit a model
GUESS <- ctmm.guess(Cilla,interactive=FALSE)
FIT <- ctmm.fit(Cilla,GUESS)

#calculate residuals
RES <- residuals(Cilla,FIT)

#scatter plot of residuals with 50% and 95% quantiles
plot(RES,col.DF=NA,level.UD=c(.50,.95))

#calculate correlogram of residuals
# increase the res argument to account for sampling variability
ACF <- correlogram(RES,res=10)

#plot 4 day's worth of lags
plot(ACF[ACF$lag<=4 %#% 'day',],fraction=1)
## End(No test)


