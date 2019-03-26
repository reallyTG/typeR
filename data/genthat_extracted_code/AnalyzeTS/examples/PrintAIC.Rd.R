library(AnalyzeTS)


### Name: PrintAIC
### Title: Print AIC Values
### Aliases: PrintAIC

### ** Examples

#----A time series--------------------------------
sl<-ts(c(180,165,110,126,125,134,163,153,122,171,171,155
,175,248,99,187,173,147,184,108,171,195,192,163))

#----The ARMA models--------------------------------
PrintAIC(sl,order=c(1,4),type="ARMA")

#----The ARIMA models--------------------------------
PrintAIC(sl,order=c(1,1,4),type="ARIMA")

#----The SARIMA models--------------------------------
PrintAIC(sl,order=c(1,1,4),seas=list(order=c(0,0,1),
frequency=4),type="SARIMA")

#----The ARCH models--------------------------------
PrintAIC(sl,order=c(4),type="ARCH")

#----The GARCH models--------------------------------
PrintAIC(sl,order=c(1,4),type="GARCH")

#----The ARIMAX models--------------------------------
#A factor
date<-as.factor(c("Tue","Wed","Thu","Fri","Mon","Tue","Wed",
"Thu","Fri","Mon","Tue","Wed","Thu","Fri","Mon","Tue","Wed",
"Thu","Fri","Mon","Tue","Wed","Thu","Fri","Mon","Tue","Wed",
"Thu","Fri","Mon","Tue","Wed","Thu"))
#Observation series.
coffee<-c(5,6,8,4,3,7,6,0,3,2,3,4,9,1,3,8,7,8,2,3,8,6,4,
4,6,7,6,5,2,3,8,4,4)
coffee<-ts(coffee,start=c(1,2),frequency=5)
Mon<-1*(date=="Mon")
event<-data.frame(Mon)
PrintAIC(coffee,order=c(2,2),xreg=event,type="ARMAX")



