library(surveillance)


### Name: nowcast
### Title: Adjust a univariate time series of counts for observed
###   but-not-yet-reported events
### Aliases: nowcast
### Keywords: models

### ** Examples

data("husO104Hosp")

#Extract the reporting triangle at a specific day
t.repTriangle <- as.Date("2011-07-04")

#Use 'void' nowcasting procedure (we just want the reporting triangle)
nc <- nowcast(now=t.repTriangle,when=t.repTriangle,
              dEventCol="dHosp",dReportCol="dReport",data=husO104Hosp,
              D=15,method="unif")

#Show reporting triangle
reportingTriangle(nc)

#Perform Bayesian nowcasting assuming the delay distribution is stable over time
nc.control <- list(N.tInf.prior=structure("poisgamma",
                                mean.lambda=50,var.lambda=3000),
                                nSamples=1e2)

t.repTriangle <- as.Date("2011-06-10")
when <- seq(t.repTriangle-3,length.out=10,by="-1 day")
nc <- nowcast(now=t.repTriangle,when=when,
              dEventCol="dHosp",dReportCol="dReport",data=husO104Hosp,
              D=15,method="bayes.trunc",control=nc.control)

#Show time series and posterior median forecast/nowcast
plot(nc,xaxis.tickFreq=list("%d"=atChange,"%m"=atChange),
     xaxis.labelFreq=list("%d"=at2ndChange),xaxis.labelFormat="%d-%b",
     xlab="Time (days)",lty=c(1,1,1,1),lwd=c(1,1,2))

## Not run: 
##D ### Using runjags to do a Bayesian model with changepoint(s)
##D ### -- this might take a while
##D nc.control.ddcp <- modifyList(nc.control,
##D                     list(gd.prior.kappa=0.1,
##D                          ddcp=list(ddChangepoint=as.Date(c("2011-05-23")),
##D                              logLambda="tps",
##D                              tau.gamma=1,
##D                              mcmc=c(burnin=1000,sample=1000,thin=1))))
##D 
##D nc.ddcp <- nowcast(now=t.repTriangle,when=when,
##D                dEventCol="dHosp",dReportCol="dReport",
##D                data=husO104Hosp, aggregate.by="1 day",
##D                method="bayes.trunc.ddcp", D=15,
##D                    control=nc.control.ddcp)
##D 
##D plot(nc.ddcp,legend.opts=NULL,
##D      xaxis.tickFreq=list("%d"=atChange,"%m"=atChange),
##D      xaxis.labelFreq=list("%d"=at2ndChange),xaxis.labelFormat="%d-%b",
##D      xlab="Time (days)",lty=c(1,1,1,1),lwd=c(1,1,2))
##D 
##D lambda <- attr(delayCDF(nc.ddcp)[["bayes.trunc.ddcp"]],"model")$lambda
##D showIdx <- seq(which( max(when) == epoch(nc.ddcp))) #seq(ncol(lambda))
##D matlines( showIdx,t(lambda)[showIdx,],col="gray",lwd=c(1,2,1),lty=c(2,1,2))
##D legend(x="topright",c(expression(lambda(t)),"95% CI"),col="gray",lwd=c(2,1),lty=c(1,2))
## End(Not run)



