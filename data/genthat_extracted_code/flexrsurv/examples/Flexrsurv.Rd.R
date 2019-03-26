library(flexrsurv)


### Name: flexrsurv
### Title: Fit Relative Survival Model
### Aliases: Flexrsurv flexrsurv flexrsurv.ll
### Keywords: survival nonlinear models

### ** Examples


# data from package relsurv
data(rdata, package="relsurv")

# rate table from package relsurv
data(slopop, package="relsurv")


# get the death rate at event (or end of followup) from slopop for rdata
rdata$iage <- findInterval(rdata$age*365.24+rdata$time, attr(slopop, "cutpoints")[[1]])
rdata$iyear <- findInterval(rdata$year+rdata$time, attr(slopop, "cutpoints")[[2]])
therate <- rep(-1, dim(rdata)[1])
for( i in 1:dim(rdata)[1]){
  therate[i] <- slopop[rdata$iage[i], rdata$iyear[i], rdata$sex[i]]
}

rdata$slorate <- therate

# change sex coding
rdata$sex01 <- rdata$sex -1

# fit a relative survival model with a non linear effect of age
fit <- flexrsurv(Surv(time,cens)~sex01+NLL(age, Knots=60, Degree=3,
                                           Boundary.knots = c(24, 95)), 
                 rate=slorate, data=rdata,
                 knots.Bh=1850,  # one interior knot at 5 years
                 degree.Bh=3,
                 Max_T=5400,
                 Spline = "b-spline",
                 initbyglm=TRUE,
                 initbands=seq(0, 5400, 100), 
                 int_meth= "BANDS",
                 bands=seq(0, 5400, 50)
                 )
summary(fit)

## Not run: 
##D # fit a relative survival model with a non linear & non proportional effect of age
##D fit2 <- flexrsurv(Surv(time,cens)~sex01+NPHNLL(age, time, Knots=60,
##D                                                Degree=3,
##D                                                Knots.t = 1850, Degree.t = 3), 
##D                  rate=slorate, data=rdata,
##D                  knots.Bh=1850,  # one interior knot at 5 years
##D                  degree.Bh=3,
##D                  Spline = "b-spline",
##D                  initbyglm=TRUE, 
##D                  int_meth= "BOOLE",
##D                  step=50
##D                  )
##D summary(fit2, correlation=TRUE)
## End(Not run)



