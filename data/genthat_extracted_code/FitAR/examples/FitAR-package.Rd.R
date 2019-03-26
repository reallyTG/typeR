library(FitAR)


### Name: FitAR-package
### Title: Fits AR and subset AR models and provides complete model
###   building capabilities. FitAR
### Aliases: FitAR-package
### Keywords: ts package

### ** Examples

#Scripts are given below for all Figures and Tables in McLeod and Zhang (2008b).
#

#Figure 1. Plot of lynx time series using plot.ts
plot(lynx)

#Figure 2. Plot of lynx series using TimeSeriesPlot
TimeSeriesPlot(lynx, type="o", pch=16, ylab="# pelts", main="Lynx Trappings")

#Figure 3. Trellis plot for Ninemile series
graphics.off() #clear previous graphics
data(Ninemile)
print(TimeSeriesPlot(Ninemile, SubLength=200))

#Figure 4. Partial autocorrelation plot of lynx series 
graphics.off() #clear previous graphics
PacfPlot(log(lynx))

## Not run: 
##D #takes some time for all these examples
##D #Figure 5. Using SelectModel to select the best subset ARz or ARp and
##D #          comparing BIC and UBIC subset selection.
##D #
##D graphics.off() #clear previous graphics
##D layout(matrix(1:4,ncol=2),respect=TRUE)
##D ansBICp<-SelectModel(log(lynx),lag.max=15,Criterion="BIC", ARModel="ARp", Best=3)
##D ansUBICp<-SelectModel(log(lynx),lag.max=15, ARModel="ARp", Best=3)
##D ansBICz<-SelectModel(log(lynx),lag.max=15,Criterion="BIC", ARModel="ARz", Best=3)
##D ansUBICz<-SelectModel(log(lynx),lag.max=15, ARModel="ARz", Best=3)
##D par(mfg=c(1,1))
##D plot(ansBICp)
##D par(mfg=c(2,1))
##D plot(ansUBICp)
##D par(mfg=c(1,2))
##D plot(ansBICz)
##D par(mfg=c(2,2))
##D plot(ansUBICz)
##D 
##D #Figure 6. Logged spectral density function fitted to square-root of monthly
##D #          sunspot series using the non-subset AR and subset ARz.
##D #          AIC and BIC are used for the AR while BIC and UBIC are used
##D #          for the ARz. Takes about 115 seconds on 3.6 GHz Pentium PC.
##D graphics.off() #clear previous graphics
##D layout(matrix(1:4,ncol=2),respect=TRUE)
##D z<-sqrt(sunspots)
##D P<-200
##D pAIC<-SelectModel(z, lag.max=P, ARModel="AR", Best=1, Criterion="AIC")
##D ARAIC<-FitAR(z, pAIC)
##D par(mfg=c(1,1))
##D sdfplot(ARAIC)
##D title(main="AIC Order Selection")
##D pBIC<-SelectModel(z, lag.max=P, ARModel="AR", Best=1, Criterion="BIC")
##D ARBIC<-FitAR(z, pBIC)
##D par(mfg=c(1,2))
##D sdfplot(ARBIC)
##D title(main="BIC Order Selection")
##D SunspotMonthARzBIC<-SelectModel(z,lag.max=P, ARModel="ARz", Best=1, Criterion="BIC")
##D ARzBIC<-FitAR(z, SunspotMonthARzBIC)
##D par(mfg=c(2,1))
##D sdfplot(ARzBIC)
##D title(main="BIC Subset Selection")
##D SunspotMonthARzUBIC<-SelectModel(z,lag.max=P, ARModel="ARz", Best=1)
##D ARzUBIC<-FitAR(z, SunspotMonthARzUBIC)
##D par(mfg=c(2,2))
##D sdfplot(ARzUBIC)
##D title(main="UBIC Subset Selection")
##D 
##D #Table 3.
##D #First part of table: AR(1) and AR(2).
##D #Only timings for GetFitAR and FitAR since the R function ar produces too many
##D #  warnings and an error message as noted in McLeod and Zhang (2008b, p.12). 
##D #The ar function with mle option is not recommended.
##D start.time<-proc.time()
##D set.seed(661177723)
##D NREP<-100 #takes about 156 sec
##D NREP<-10 #takes about 16 sec
##D ns<-c(50,100,200,500,1000)
##D ps<-c(1,2) #AR(p), p=1,2
##D tmsA<-matrix(numeric(4*length(ns)*length(ps)),ncol=4)
##D ICOUNT<-0
##D for (IP in 1:length(ps)){
##D p<-ps[IP]
##D for (ISIM in 1:length(ns)){
##D     ICOUNT<-ICOUNT+1
##D     n<-ns[ISIM]
##D     ptm <- proc.time()
##D     for (i in 1:NREP){
##D         phi<-PacfToAR(runif(p, min=-1, max =1))
##D         z<-SimulateGaussianAR(phi,n)
##D         phiHat<-try(GetFitAR(z,p,MeanValue=mean(z))$phiHat)
##D         }
##D     t1<-(proc.time() - ptm)[1]
##D #
##D     ptm <- proc.time()
##D     for (i in 1:NREP){
##D         phi<-PacfToAR(runif(p, min=-1, max =1))
##D         z<-SimulateGaussianAR(phi,n)
##D         phiHat<-try(FitAR(z,p,MeanMLEQ=TRUE)$phiHat)
##D         }
##D     t2<-(proc.time() - ptm)[1]
##D #
##D     ptm <- proc.time()
##D     for (i in 1:NREP){
##D         phi<-PacfToAR(runif(p, min=-1, max =1))
##D         z<-SimulateGaussianAR(phi,n)
##D         #uncomment this line and next two lines for ar timings -- expect lots of
##D         #   warnings and an error message!!
##D         #phiHat<-try(ar(z,aic=FALSE,order.max=p,method="mle")$ar)
##D         #delete this line and the next one
##D         phiHat<-NA
##D     }
##D     #uncomment this line for ar timings
##D          #t3<-(proc.time() - ptm)[1]
##D          t3<-NA #delete this line for ar timings
##D 
##D         tmsA[ICOUNT,]<-c(n,t1,t2,t3)
##D   } 
##D } 
##D rnames<-c(rep("AR(1)", length(ns)),rep("AR(2)", length(ns)) )
##D cnames<-c("n", "GetFitAR", "FitAR", "ar")  
##D dimnames(tmsA)<-list(rnames,cnames)
##D tmsA[,-1]<-round(tmsA[,-1]/NREP,2)
##D end.time<-proc.time()
##D total.time<-(end.time-start.time)[1]
##D 
##D #Second part of table: AR(20) and AR(40).
##D #NOTE: ar is not recommended with method="mle" produces numerous warnings
##D #      and also takes a long time!
##D         start.time<-proc.time()
##D         set.seed(661177723)
##D         NREP<-100 #takes 7.5 hours
##D         NREP<-10 #takes 45 minutes
##D         ns<-c(1000,2000,5000)
##D         ps<-c(20,40)
##D         tmsB<-matrix(numeric(4*length(ns)*length(ps)),ncol=4)
##D         ICOUNT<-0
##D         for (IP in 1:length(ps)){
##D         p<-ps[IP]
##D         phi<-PacfToAR(0.8/(1:p))
##D         for (ISIM in 1:length(ns)){
##D             ICOUNT<-ICOUNT+1
##D             n<-ns[ISIM]
##D             ptm <- proc.time()
##D             for (i in 1:NREP){
##D                 z<-SimulateGaussianAR(phi,n)
##D                 phiHat<-try(GetFitAR(z,p,MeanValue=mean(z))$phiHat)
##D                 }
##D             t1<-(proc.time() - ptm)[1]
##D             ptm <- proc.time()
##D             for (i in 1:NREP){
##D                 z<-SimulateGaussianAR(phi,n)
##D                 phiHat<-try(FitAR(z,p,MeanMLEQ=TRUE)$phiHat)
##D                 }
##D             t2<-(proc.time() - ptm)[1]
##D             ptm <- proc.time()
##D             for (i in 1:NREP){
##D                 z<-SimulateGaussianAR(phi,n)
##D                 phiHat<-try(ar(z,aic=FALSE,order.max=p,method="mle")$ar)
##D                 }
##D             t3<-(proc.time() - ptm)[1]
##D             tmsB[ICOUNT,]<-c(n,t1,t2,t3)
##D         } 
##D         }   
##D         rnames<-c( rep("AR(20)", length(ns)), rep("AR(40)", length(ns)) )
##D         cnames<-c("n", "GetFitAR", "FitAR", "ar")  
##D         dimnames(tmsB)<-list(rnames,cnames)
##D         tmsB[,-1] <- round(tmsB[,-1]/NREP,2)
##D         end.time<-proc.time()
##D         total.time<-(end.time-start.time)[1]
##D 
##D #Figure 7. Comparing Box-Cox analyses using FitAR and MASS
##D library(MASS)
##D graphics.off() #clear previous graphics
##D layout(matrix(c(1,2,1,2),ncol=2))
##D pvec<-c(1,2,4,10,11)
##D out<-FitAR(lynx, ARModel="ARp", pvec)
##D BoxCox(out)
##D PMAX<-max(pvec)
##D Xy <- embed(lynx, PMAX + 1)
##D y <- Xy[, 1]
##D X <- (Xy[, -1])[, pvec] #pvec != 1
##D outlm<-lm(y~X)
##D boxcox(outlm,lambda=seq(0.0,0.6,0.05))
##D 
##D #Figure 8
##D graphics.off() #clear previous graphics
##D BoxCox(AirPassengers) #takes about 30 sec
##D 
##D #Figure 9
##D graphics.off() #clear previous graphics
##D data(rivers)
##D BoxCox(rivers)
##D title(sub="Length of 141 North American Rivers")
##D 
##D #Figure 10
##D graphics.off() #clear previous graphics
##D data(USTobacco)
##D TimeSeriesPlot(USTobacco, aspect=1)
##D 
##D #Figure 11
##D graphics.off() #clear previous graphics
##D data(USTobacco)
##D outUST<-arima(USTobacco, c(0,1,1))
##D BoxCox(outUST)
##D 
##D #Figure 12. Basic diagnostic plots for ARp fitted to the log lynx series
##D graphics.off() #clear previous graphics
##D out<-FitAR(log(lynx), ARModel="ARp", c(1,2,4,10,11))
##D plot(out, terse=TRUE)
##D 
##D #Figure 13. RSF plot for ARp fitted to log lynx series
##D graphics.off() #clear previous graphics
##D out<-FitAR(log(lynx), ARModel="ARp", c(1,2,4,10,11))
##D rfs(out)
##D 
##D #Table 6. Comparison of bootstrap and large-sample sd
##D #Use bootstrap to compute standard errors of parameters
##D #takes about 34 seconds on a 3.6 GHz PC
##D ptm <- proc.time() #user time
##D set.seed(2491781) #for reproducibility
##D R<-100  #number of bootstrap iterations
##D p<-c(1,2,4,7,10,11)
##D ans<-FitAR(log(lynx),p)
##D out<-Boot(ans, R)
##D fn<-function(z) FitAR(z,p)$zetaHat
##D sdBoot<-sqrt(diag(var(t(apply(out,fn,MARGIN=2)))))
##D sdLargeSample<-coef(ans)[,2][1:6]
##D sd<-matrix(c(sdBoot,sdLargeSample),ncol=2)
##D dimnames(sd)<-list(names(sdLargeSample),c("Bootstrap","LargeSample"))
##D ptm<-(proc.time()-ptm)[1]
##D sd
##D 
## End(Not run)





