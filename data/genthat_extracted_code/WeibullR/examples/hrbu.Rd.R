library(WeibullR)


### Name: hrbu
### Title: Hirose and Ross beta unbias factors for Weibull MLE
### Aliases: hrbu
### Keywords: likelihood bias

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
MLEfit<-mlefit(mleframe(failures,suspensions))
MLE_Unbiased<-c(MLEfit[1],MLEfit[2]*hrbu(length(failures),length(suspensions)))



