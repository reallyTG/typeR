library(mets)


### Name: gofM.phreg
### Title: GOF for Cox covariates in PH regression
### Aliases: gofM.phreg cumContr gofZ.phreg

### ** Examples

library(mets)
data(TRACE)
set.seed(1)
TRACEsam <- blocksample(TRACE,idvar="id",replace=FALSE,100)

dcut(TRACEsam)  <- ~. 
mm <- model.matrix(~-1+factor(wmicat.4),data=TRACEsam)
m1 <- gofM.phreg(Surv(time,status==9)~vf+chf+wmi,data=TRACEsam,modelmatrix=mm)
summary(m1)
if (interactive()) {
par(mfrow=c(2,2))
plot(m1)
}

m1 <- gofM.phreg(Surv(time,status==9)~strata(vf)+chf+wmi,data=TRACEsam,modelmatrix=mm) 
summary(m1)

## cumulative sums in covariates, via design matrix mm 
mm <- cumContr(TRACEsam$wmi,breaks=10,equi=TRUE)
m1 <- gofM.phreg(Surv(time,status==9)~strata(vf)+chf+wmi,data=TRACEsam,
		  modelmatrix=mm,silent=0)
summary(m1)

## cumulative sums in covariates, via design matrix mm
## No test: 
 ## Reduce Ex.Timings
m1 <- gofZ.phreg(Surv(time,status==9)~strata(vf)+chf+wmi+age,data=TRACEsam,
                 vars=c("wmi","age"))
summary(m1) 
plot(m1,type="z")
## End(No test)



