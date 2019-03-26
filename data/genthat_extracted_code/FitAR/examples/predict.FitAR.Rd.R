library(FitAR)


### Name: predict.FitAR
### Title: Predict Subset AR Model
### Aliases: predict.FitAR
### Keywords: ts

### ** Examples

## Not run: 
##D #these examples take about a minute
##D #Example 1.  
##D #Compare the predictions for the monthly sunspots using the ARz
##D #  fitted using the UBIC and BIC.
##D #  This computation takes about 3-4 minutes.
##D 
##D `getRMSE` <-
##D function(obj, zTOT, n.ahead = 12, newdata=numeric(0)){
##D     ans<-predict(obj, n.ahead=n.ahead, newdata=newdata)
##D     ansf<-ans$Forecasts
##D     nL<-as.numeric(colnames(ansf))
##D     nO<-as.numeric(rownames(ansf))
##D     err<-ansf-zTOT[-1+outer(nO,nL,FUN="+")]
##D     s<-apply(err, MARGIN=2, FUN=rmse)
##D     s
##D }
##D 
##D `rmse` <-
##D function(x){
##D y<-x[!is.na(x)]
##D sqrt(sum(y^2)/length(y))
##D }
##D 
##D zTOT <- sqrt(sunspots)
##D nTOT <- length(zTOT)
##D nOUT <- 12*3 #using last 3 years for out-of-sample forecasts
##D ind<- (1:nTOT)<(nTOT-nOUT+1)
##D newdata<-zTOT[!ind]
##D z<-zTOT[ind]
##D lag.max<-12*11 #using lags up to last 11 years in subset model
##D nahead<-4 #forecasts for 1 to 4 months ahead
##D pUBIC <- SelectModel(z, ARModel="ARz", lag.max=lag.max, Best=1)
##D zUBIC <- FitAR(z, pUBIC, ARModel="ARz")
##D pBIC <- SelectModel(z, ARModel="ARz",lag.max=lag.max,Best=1,Criterion="BIC")
##D zBIC <- FitAR(z, pBIC, ARModel="ARz")
##D fubic<-getRMSE(zUBIC, zTOT, n.ahead=nahead, newdata=newdata)
##D fbic<-getRMSE(zBIC, zTOT, n.ahead=nahead, newdata=newdata)
##D m<-matrix(c(fubic,fbic), ncol=2)
##D dimnames(m)<-list(1:nahead, c("fubic","fbic")) 
##D m
##D #
##D #Example 2.
##D #Compute predictions and plot observed - predicted
##D z <- sqrt(sunspots)
##D pUBIC <- SelectModel(z, ARModel="ARz", lag.max=240, Best=1)
##D zUBIC <- FitAR(z, pUBIC, ARModel="ARz")
##D out<-predict(zUBIC, n.ahead=24)
##D zf<-out$Forecasts
##D zsd<-out$SDForecasts
##D y<-cts(z, zf)
##D plot(window(y,start=1980), type="n", ylab="sqrt sunspot number")
##D y1<-window(y, start=1980, end=1983)
##D lines.ts(y1,col="blue",type="o", lwd=2, pch=16)
##D y2<-window(y, start=c(1983,1))
##D lines.ts(y2,col="red",type="o",lwd=2, pch=16)
##D legend(1984,12, legend=c("observed", "forecast"),col=c("red","blue"),lwd=c(2,2),pch=c(16,16))
## End(Not run)



