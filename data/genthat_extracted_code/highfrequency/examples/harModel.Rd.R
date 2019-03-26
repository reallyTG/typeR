library(highfrequency)


### Name: harModel
### Title: HAR model estimation (Heterogeneous Autoregressive model for
###   Realized volatility)
### Aliases: harModel
### Keywords: forecasting

### ** Examples
 
 ##### Example 1: HARRVCJ ##### 
 data("sample_5minprices_jumps"); 
   dat = sample_5minprices_jumps[,1];
 dat = makeReturns(dat); #Get the high-frequency return data
 
 x = harModel(dat, periods = c(1,5,10), periodsJ=c(1,5,10), RVest = c("rCov","rBPCov"), 
       type="HARRVCJ",transform="sqrt"); 
 # Estimate the HAR model of type HARRVCJ  
 class(x);
 x 

 ##### Example 2:  ##### 
 # Forecasting daily Realized volatility for DJI 2008 using the basic harModel: HARRV
 data(realized_library); #Get sample daily Realized Volatility data
 DJI_RV = realized_library$Dow.Jones.Industrials.Realized.Variance; #Select DJI
 DJI_RV = DJI_RV[!is.na(DJI_RV)]; #Remove NA's
 DJI_RV = DJI_RV['2008'];

 x = harModel(data=DJI_RV , periods = c(1,5,22), RVest = c("rCov"), 
    type="HARRV",h=1,transform=NULL);
 class(x); 
 x;
 summary(x);
# plot(x);



