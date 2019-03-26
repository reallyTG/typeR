library(currentSurvival)


### Name: cci
### Title: Estimates Current Cumulative Incidence (CCI) and Common
###   Cumulative Incidence (comCI) Functions
### Aliases: cci
### Keywords: survival

### ** Examples

## 4 examples of CCI estimation without stratification (and 
## comCI estimation) with and without confidence intervals:
data(cml)  # load example data set
cml <- cml[,c(1:7)] # select event and follow-up times and death
           # (stratification factor is not included)
res <- cci(cml) # CCI + comCI without confidence intervals
res <- cci(cml, com.est=FALSE) # CCI without confidence intervals
## Not run: 
##D res <- cci(cml, conf.int=TRUE, no.iter=10) # CCI + comCI with 
##D            # confidence intervals
##D res <- cci(cml, com.est=FALSE, conf.int=TRUE, no.iter=10) # CCI 
##D            # with confidence intervals
## End(Not run)

## 4 examples of CCI estimation with stratification (and comCI 
## estimation) with and without confidence intervals:
data(cml)  # load example data set
cml <- cml[,c(1:7,10)] # select event and follow-up times, death,
           # and the EUTOS score as a stratification parameter
res <- cci(cml, strat=TRUE) # stratified CCI + comCI without 
           # confidence intervals
res <- cci(cml, com.est=FALSE, strat=TRUE) # stratified CCI 
           # without confidence intervals
## Not run: 
##D res <- cci(cml, conf.int=TRUE, no.iter=10, strat=TRUE, pvals=TRUE)
##D            # stratified CCI + comCI with confidence intervals
##D res <- cci(cml, com.est=FALSE, conf.int=TRUE, no.iter=10, 
##D            strat=TRUE, pvals=TRUE) # stratified CCI with 
##D            # confidence intervals
## End(Not run)

## Not run: 
##D ## As the function does not allow setting plot option (e.g. line
##D ## colour, width and type), you can create a plot using the 
##D ## following commands:
##D data(cml)  # load example data set
##D cml <- cml[,c(1:7)] # select event and follow-up times and death
##D            # (stratification factor is not included)
##D res <- cci(cml, conf.int=TRUE, no.iter=10) # CCI + comCI with 
##D            # confidence intervals 
##D maxx <- max(res$pest.day[,1]) # maximum follow-up time in days
##D x=0:maxx
##D yrs <- floor(maxx/365) # maximum follow-up time in years
##D plot(0,0,pch='.',cex=0.01,xlab="Years after therapy initiation",
##D      ylab="Probability",axes=FALSE,xlim=c(0,maxx),ylim=c(0,1)) 
##D      # plot initialization
##D axis(2,at=seq(0,1,0.2)) # setting of points where tick-marks are
##D      # to be drawn on the y-axis
##D axis(1,at=seq(0,((yrs+1)*365),365),labels=seq(0,(yrs+1),1)) 
##D      # setting of points where tick-marks are to be drawn on the
##D      # x-axis
##D lines(x,res$pest.day[,2],type="S",lty=1,lwd=1) # lower confidence
##D      # interval for the CCI function estimate
##D lines(x,res$pest.day[,3],type="S",lty=1,lwd=2) # CCI estimate
##D lines(x,res$pest.day[,4],type="S",lty=1,lwd=1) # upper confidence
##D      # interval for the CCI function estimate
##D lines(x,res$pest.day[,5],type="S",lty=2,lwd=1) # lower confidence 
##D      # interval for the comCI function estimate
##D lines(x,res$pest.day[,6],type="S",lty=2,lwd=2) # comCI estimate
##D lines(x,res$pest.day[,7],type="S",lty=2,lwd=1) # upper confidence
##D      # interval for the comCI function estimate
##D legend("bottomright",legend=c("CCI","95% conf. int.","comCI",
##D        "95% conf. int."),lwd=c(2,1,2,1),lty=c(1,1,2,2),bty="n",
##D        cex=0.9) 
## End(Not run)




