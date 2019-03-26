library(TransModel)


### Name: summary.TransModel
### Title: Summary results for fitting the linear transformation model
### Aliases: summary.TransModel

### ** Examples

data(veteran)
fit<-TransModel(Surv(time,status)~karno+as.factor(celltype),data=veteran,r=0,subset=(prior==0))
summary(fit)

fit0<-TransModel(Surv(time,status)~1,data=veteran,r=0,subset=(prior==0))  #the null model
summary(fit0)



