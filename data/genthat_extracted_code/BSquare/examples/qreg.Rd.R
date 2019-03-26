library(BSquare)


### Name: qreg
### Title: Quantile regression with parametric basis functions.)
### Aliases: qreg

### ** Examples

  #Continuous data example
  #Load the air quality data
  data(airquality)
  ozone<-airquality[,1]
  solar<-airquality[,2]
  
  #Remove missing observations
  missing<-is.na(ozone+solar)
  ozone<-ozone[!missing]
  solar<-solar[!missing]
  solar_std<-1.8*(solar - min(solar))/(max(solar)-min(solar)) - 0.9
  
  #Fit the model and plot results
  X<-cbind(1,solar_std)
  #use longer chains in practice
  fit<-qreg(X,ozone,L=4,base="gamma", iters = 1000, burn = 1000)
  qr_plot(fit,2, main = "Solar Effect")

  
  #Right-censored data example
  
  library(survival)
  data(veteran)
  
  trt<-ifelse(veteran[,1]==2,-1,1)
  logtime<-log(veteran[,3])
  event<-veteran[,4]
  status<-ifelse(event==1,0,2)
  X<-cbind(1,trt)
  #use longer chains in practice
  fit<-qreg(X,Y=logtime,status=status,iters =1000, burn = 1000)
  qr_plot(fit,index=2,main="Treatment effect")



