library(newTestSurvRec)


### Name: FitSurvRec
### Title: Compute a Survival Curve for Recurrent Event Data given a
###   variable of group
### Aliases: FitSurvRec
### Keywords: Plot Survival

### ** Examples

data(MMC.TestSurvRec)
# fit a PSH survival function and plot it
fitPSH<-FitSurvRec(Survrecu(id,time,event)~1,data=MMC.TestSurvRec)
plot(fitPSH$time,fitPSH$survfunc,type="s" ,ylim=c(0,1),
     xlim=c(0,max(fitPSH$time)))
title(main = list("Survival Curve with Recurrent Event Data", 
      cex = 0.8, font = 2.3, col = "dark blue"))
mtext("Research Group: AVANCE USE R!", cex = 0.7, font = 2, 
      col = "dark blue", line = 1)
mtext("Software made by: Dr. Carlos Martinez", cex = 0.6, font = 2, 
      col = "dark red", line = 0)
 ## No test: 
fitWC<-FitSurvRec(Survrecu(id,time,event)~1,data=MMC.TestSurvRec,
              type="wang-chang")
plot(fitWC$time,fitWC$survfunc,type="s" ,ylim=c(0,1),xlim=c(0,max(fitWC$time)))
  	  title(main = list("Survival Curve with Recurrent Event Data", 
       cex = 0.8, font = 2.3, col = "dark blue"))
        mtext("Research Group: AVANCE USE R!", cex = 0.7, font = 2, 
       col = "dark blue", line = 1)
        mtext("Software made by: Dr. Carlos Martinez", cex = 0.6, font = 2, 
       col = "dark red", line = 0)
              
## End(No test)



