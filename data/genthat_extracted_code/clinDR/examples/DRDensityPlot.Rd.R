library(clinDR)


### Name: DRDensityPlot
### Title: Plot Bayes or confidence interval density contours over a grid
###   of points (usually dose or time)
### Aliases: DRDensityPlot
### Keywords: nonlinear hplot

### ** Examples


## Not run: 
##D data(examples14)
##D exdat<-examples14[[32]]
##D 
##D fitout<-fitEmax(exdat$y,exdat$dose,modType=3,count=exdat$nsize,
##D 								msSat=(exdat$sd)^2)
##D 
##D dgrid<-seq(0,1,length=100)
##D seout95<-predict(fitout,dgrid,clev=0.95)
##D seout90<-predict(fitout,dgrid,clev=0.9)
##D seout80<-predict(fitout,dgrid,clev=0.8)
##D seout50<-predict(fitout,dgrid,clev=0.5)
##D 
##D qlev<-c(0.025,0.05,0.10,0.25)
##D 
##D qL<-cbind(seout95$ubdif,seout90$ubdif,seout80$ubdif,seout50$ubdif)
##D qH<-cbind(seout95$lbdif,seout90$lbdif,seout80$lbdif,seout50$lbdif)
##D 
##D DRDensityPlot(dgrid,qL,qH,qlevL=qlev,xlab='Dose',ylab='Diff with PBO')
##D 
## End(Not run)
## Don't show: 
data(examples14)
exdat<-examples14[[32]]

dgrid<-seq(0,1,length=5)

qlev<-c(0.10,0.25)

qL<-matrix(c(0.000000, 0.000000,
1.181590, 1.093189,
1.301505, 1.220726,
1.354046, 1.273955,
1.384266, 1.303586),ncol=2,byrow=TRUE)

qH<-matrix(c(0.0000000, 0.0000000,
0.8083449, 0.8967468,
0.9604440, 1.0412232,
1.0158898, 1.0959808,
1.0436238, 1.1243036),ncol=2,byrow=TRUE)

DRDensityPlot(dgrid,qL,qH,qlevL=qlev,xlab='Dose',ylab='Diff with PBO')
## End(Don't show)



