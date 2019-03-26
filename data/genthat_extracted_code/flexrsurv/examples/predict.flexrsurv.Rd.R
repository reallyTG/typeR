library(flexrsurv)


### Name: predict.flexrsurv
### Title: Predictions for a relative survival model
### Aliases: predict.flexrsurv

### ** Examples


## Not run: 
##D 
##D # data from package relsurv
##D data(rdata, package="relsurv")
##D 
##D # rate table from package relsurv
##D data(slopop, package="relsurv")
##D 
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
##D # change sex coding
##D rdata$sex01 <- rdata$sex -1
##D # centering age
##D rdata$agec <- rdata$age- 60
##D 
##D # fit a relative survival model with a non linear effect of age
##D fit <- flexrsurv(Surv(time,cens)~sex01+NLL(age, Knots=60, Degree=3,
##D                                            Boundary.knots = c(24, 95)), 
##D                  rate=slorate, data=rdata,
##D                  knots.Bh=1850,  # one interior knot at 5 years
##D                  degree.Bh=3,
##D                  Spline = "b-spline",
##D                  initbyglm=TRUE, 
##D                  int_meth= "BOOLE",
##D                  step=50
##D                  )
##D summary(fit, correlation=TRUE)
##D 
##D 
##D 
##D newrdata <- rdata
##D newrdata$age <- rep(60, length(rdata$age))
##D newrdata$sex <- factor(newrdata$sex, labels=c("m", "f"))
##D 
##D 
##D 
##D linpred <- predict(fit, newdata=newrdata, type="lp", se.fit=TRUE )
##D predhazard <- predict(fit, newdata=newrdata, type="hazard" , se.fit=TRUE )
##D predcumhazard <- predict(fit, newdata=newrdata, type="cum", se.fit=TRUE)
##D 
##D 
##D require(ggplot2)
##D tmp <- cbind(newrdata, linpred)
##D glp <- ggplot(tmp, aes(time, colour=sex))
##D glp + geom_ribbon(aes(ymin = fit-2*se.fit, ymax = fit + 2*se.fit, fill=sex)) +
##D    geom_line(aes(y=fit)) +
##D    scale_fill_manual(values = alpha(c("blue", "red"), .3))
##D 
##D 
##D tmp <- cbind(newrdata, predhazard)
##D glp <- ggplot(tmp, aes(time, colour=sex))
##D glp + geom_ribbon(aes(ymin = fit-2*se.fit, ymax = fit + 2*se.fit, fill=sex)) +
##D    geom_line(aes(y=fit))  +
##D    scale_fill_manual(values = alpha(c("blue", "red"), .3))
##D 
##D 
##D tmp <- cbind(newrdata, predcumhazard)
##D glp <- ggplot(tmp, aes(time, colour=sex))
##D glp + geom_ribbon(aes(ymin = fit-2*se.fit, ymax = fit + 2*se.fit, fill=sex)) +
##D    geom_line(aes(y=fit)) +
##D    scale_fill_manual(values = alpha(c("blue", "red"), .3))
##D 
## End(Not run)



