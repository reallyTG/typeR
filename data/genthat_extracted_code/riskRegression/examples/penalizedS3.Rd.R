library(riskRegression)


### Name: penalizedS3
### Title: S3-wrapper for S4 function penalized
### Aliases: penalizedS3

### ** Examples

## Not run: 
##D ## too slow
##D library(penalized)
##D set.seed(8)
##D d <- sampleData(200,outcome="binary")
##D newd <- sampleData(80,outcome="binary")
##D fitridge <- penalizedS3(Y~X1+X2+pen(7:8), data=d, type="ridge",
##D standardize=TRUE, model="logistic",trace=FALSE)
##D fitlasso <- penalizedS3(Y~X1+X2+pen(7:8), data=d, type="lasso",
##D standardize=TRUE, model="logistic",trace=FALSE)
##D # fitnet <- penalizedS3(Y~X1+X2+pen(7:8), data=d, type="elastic.net",
##D # standardize=TRUE, model="logistic",trace=FALSE)
##D predictRisk(fitridge,newdata=newd)
##D predictRisk(fitlasso,newdata=newd)
##D # predictRisk(fitnet,newdata=newd)
##D Score(list(fitridge),data=newd,formula=Y~1)
##D Score(list(fitridge),data=newd,formula=Y~1,split.method="bootcv",B=2)
## End(Not run)
## Not run: 
##D  data(nki70) ## S4 fit
##D pen <- penalized(Surv(time, event), penalized = nki70[,8:77],
##D                  unpenalized = ~ER+Age+Diam+N+Grade, data = nki70,
##D lambda1 = 1)
##D penS3 <- penalizedS3(Surv(time,event)~ER+Age+Diam+pen(8:77)+N+Grade,
##D                      data=nki70, lambda1=1)
##D ## or
##D penS3 <- penalizedS3(Surv(time,event)~ER+pen(TSPYL5,Contig63649_RC)+pen(10:77)+N+Grade,
##D                      data=nki70, lambda1=1)
##D ## also this works
##D penS3 <- penalizedS3(Surv(time,event)~ER+Age+pen(8:33)+Diam+pen(34:77)+N+Grade,
##D                     data=nki70, lambda1=1)
## End(Not run)



