library(flexrsurv)


### Name: summary.flexrsurv
### Title: Summarizing Flexible Relative Survival Model Fits
### Aliases: summary.flexrsurv print.summary.flexrsurv

### ** Examples

## Not run: 
##D # data from package relsurv
##D data(rdata, package="relsurv")
##D # rate table from package relsurv
##D data(slopop, package="relsurv")
##D 
##D # get the death rate at event (or end of followup) from slopop for rdata
##D rdata$iage <- findInterval(rdata$age*365.24+rdata$time, attr(slopop, "cutpoints")[[1]])
##D rdata$iyear <- findInterval(rdata$year+rdata$time, attr(slopop, "cutpoints")[[2]])
##D therate <- rep(-1, dim(rdata)[1])
##D for( i in 1:dim(rdata)[1]){
##D   therate[i] <- slopop[rdata$iage[i], rdata$iyear[i], rdata$sex[i]]
##D }
##D 
##D rdata$slorate <- therate
##D 
##D 
##D # change sex coding
##D rdata$sex01 <- rdata$sex -1
##D 
##D # fit a relative survival model with a non linear effetc of age
##D 
##D fit <- flexrsurv(Surv(time,cens)~sex01+NLL(age, Knots=60, Degree=3), 
##D                  rate=slorate, data=rdata,
##D                  knots.Bh=1850,  # one interior knot at 5 years
##D                  degree.Bh=3,
##D                  Spline = "b-spline",
##D                  initbyglm=TRUE, 
##D                  initbands=seq(from=0, to=5400, by=200),
##D                  int_meth= "CAV_SIM",
##D                  step=50
##D                  )
##D 
##D summary(fit)
## End(Not run)



