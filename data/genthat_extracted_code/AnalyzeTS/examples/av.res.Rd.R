library(AnalyzeTS)


### Name: av.res
### Title: The criterion to evaluate forecasting model
### Aliases: av.res

### ** Examples

#----------The moving average models-------------------------
library(TTR)
data(enrollment)
sma5<-ts(SMA(enrollment,5),start=1971)
dsma5.5<-ts(SMA(SMA(enrollment)),start=1971)
cma5<-as.ts(CMA(enrollment,5))
ses.002<-as.ts(SES(enrollment,0.002))

#Translate series to data frame
actual<-data.frame(enrollment)
forecasted<-data.frame(sma5,dsma5.5,cma5,ses.002)

#Comparing forecasting models
av.res(Y=actual,F=forecasted,r=5)


#----------The liner and arima models-------------------------
#Loading data
#data(enrollment)

#Liner model
#t<-1:length(enrollment)
#lm.model<-lm(enrollment~t)

#Arima modle
#arima.model<-arima(enrollment,order=c(1,1,0))

#Translate residual series to data frame
#actual<-data.frame(enrollment)
#residual.models<-data.frame(lm=lm.model$resid,arima=arima.model$resid)

#Comparing forecasting models
#av.res(Y=actual,E=residual.models)


#----------The fuzzy time series models-------------------------
#Following example(fuzzy.ts1)
#Comparing fuzzy time series models for lh time series
#from example of fuzzy.ts1 function
#av.res(Y=data.frame(lh),F=data.frame(chen10,singh10,heuristic10,chenhsu6))

#Following example(Gfuzzy.ts1)
#Comparing fuzzy time series models for lh time series
#from example of Gfuzzy.ts1 function
#av.res(Y=data.frame(lh),F=KQ3)

#Following example(Gfuzzy.ts2)
#Comparing fuzzy time series models for enrollment time series
#from example of Gfuzzy.ts2 function
#av.res(Y=data.frame(enrollment),F=g.fuzzy1$interpolate)



