library(wally)


### Name: wallyPlot
### Title: Wally plots to assess calibration of a risk or survival
###   prediction
### Aliases: wallyPlot

### ** Examples

# Survival setting
library(prodlim)
library(survival)
set.seed(180)
d = SimSurv(180)
f = coxph(Surv(time,status)~X1+X2,data=d,x=TRUE)
## Not run: 
##D wallyPlot(f,
##D           time=4,
##D           q=10,
##D           data=d,
##D           formula=Surv(time,status)~1)
##D  wallyPlot(f,
##D           time=4,
##D           q=10,
##D           hanging=TRUE,
##D           data=d,
##D           formula=Surv(time,status)~1)
## End(Not run)

# Competing risks setting
library(prodlim)
library(survival)
library(riskRegression)
set.seed(180)
d2 = SimCompRisk(180)
f2 = CSC(Hist(time,event)~X1+X2,data=d2)
## Not run: 
##D wallyPlot(f2,
##D           time=5,
##D           q=3,
##D           hanging=TRUE,
##D           data=d2,
##D           formula=Hist(time,event)~1)
##D 
## End(Not run)

# Reproduce Wally plots presented in Blanche et al. (2017)
## Not run: 
##D data(threecity)
##D wallyPlot(threecity$pi,
##D time=5,
##D hanging=TRUE,
##D formula=Hist(time,status)~1,
##D data=threecity,
##D ylim=c(-.1,.25),
##D seed= 511,
##D hline.lwd=3,
##D mar=c(1.01, 4.1, 1.15, 2))
## End(Not run)

## Not run: 
##D data(divat)
##D wallyPlot(divat$pi,
##D time=5,
##D hanging=TRUE,
##D formula=Hist(time,status)~1,
##D data=divat,
##D ylim=c(-.1,.60),
##D seed= 123459,
##D hline.lwd=3,
##D mar=c(1.01, 4.1, 1.15, 2))
## End(Not run)



