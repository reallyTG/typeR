library(ICBayes)


### Name: ICBayes
### Title: PH, PO, and Probit Models for Interval-Censored Data
### Aliases: ICBayes ICBayes.default ICBayes.formula
### Keywords: case 1 interval-censored data case 2 interval-censored data

### ** Examples

# To save time in checking package, niter is set to only 500 iterations.
# formula form
data(bcdata)
bcdata<-data.frame(bcdata) # must be a data frame
try<-ICBayes(Surv(L,R,type='interval2')~x1,data=bcdata,
model='case2ph',status=bcdata[,3],x_user=c(0,1),knots=seq(0.1,60.1,length=10),
grids=seq(0.1,60.1,by=1),niter=500,burnin=100)
# general form
try2<-ICBayes(model='case2ph',L=bcdata[,1],R=bcdata[,2],status=bcdata[,3],
xcov=bcdata[,4],x_user=c(0,1),knots=seq(0.1,60.1,length=10),
grids=seq(0.1,60.1,by=1),niter=500,burnin=100)



