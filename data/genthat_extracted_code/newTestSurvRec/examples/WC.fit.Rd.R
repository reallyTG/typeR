library(newTestSurvRec)


### Name: WC.fit
### Title: Survival function estimator for recurrence time data using the
###   estimator developed by Wang and Chang
### Aliases: WC.fit
### Keywords: datasets survival

### ** Examples
XL<-data(MMC.TestSurvRec)
#-------------------------------------------------------------------------------------
fitPSHa<-PSH.fit(Survrecu(MMC.TestSurvRec$id,MMC.TestSurvRec$time,
                        MMC.TestSurvRec$event))
fitPSHa$surv
fitPSHa$time
plot(fitPSHa$time,fitPSHa$survfunc,type="s" ,ylim=c(0,1),
        xlim=c(0,max(fitPSHa$time)))
title(main = list("Survival Curve with Recurrent Event Data", 
        cex = 0.8, font = 2.3, col = "dark blue"))
mtext("Research Group: AVANCE USE R!", cex = 0.7, font = 2, 
        col = "dark blue", line = 1)
mtext("Software made by: Dr. Carlos Martinez", cex = 0.6, font = 2, 
        col = "dark red", line = 0)

## No test: 
fitWCa<-WC.fit(Survrecu(MMC.TestSurvRec$id,MMC.TestSurvRec$time,
                        MMC.TestSurvRec$event))
fitWCa$surv
fitWCa$time
plot(fitWCa$time,fitWCa$survfunc,type="s" ,ylim=c(0,1),
        xlim=c(0,max(fitWCa$time)))
## End(No test)



