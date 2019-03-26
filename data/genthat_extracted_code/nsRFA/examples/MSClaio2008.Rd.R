library(nsRFA)


### Name: MSClaio2008
### Title: Model Selection Criteria
### Aliases: MSClaio2008 print.MSClaio2008 plot.MSClaio2008
###   summary.MSClaio2008
### Keywords: htest

### ** Examples

data(FEH1000)

sitedata <- am[am[,1]==53004, ] # data of site 53004
serieplot(sitedata[,4], sitedata[,3])
MSC <- MSClaio2008(sitedata[,4])
MSC
summary(MSC)
plot(MSC)

sitedata <- am[am[,1]==69023, ]	# data of site 69023
serieplot(sitedata[,4], sitedata[,3])
MSC <- MSClaio2008(sitedata[,4], crit=c("AIC", "ADC"))
MSC
summary(MSC)
plot(MSC)

sitedata <- am[am[,1]==83802, ] # data of site 83802
serieplot(sitedata[,4], sitedata[,3])
MSC <- MSClaio2008(sitedata[,4], dist=c("GEV", "P3", "LP3"))
MSC
summary(MSC)
plot(MSC)

# short sample, high positive L-CA
sitedata <- am[am[,1]==40012, ] # data of site 40012
serieplot(sitedata[,4], sitedata[,3])
MSC <- MSClaio2008(sitedata[,4])
MSC
summary(MSC)
plot(MSC)

# negative L-CA
sitedata <- am[am[,1]==68002, ] # data of site 68002
serieplot(sitedata[,4], sitedata[,3])
MSC <- MSClaio2008(sitedata[,4])
MSC
summary(MSC)
plot(MSC)




