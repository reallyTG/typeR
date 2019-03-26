library(mma)


### Name: summary.med_iden
### Title: Summary method for class "med_iden".
### Aliases: summary.med_iden print.summary.med_iden

### ** Examples

data("weight_behavior")
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.b.b.2<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="M", alpha=0.4,alpha2=0.4)
 summary(data.b.b.2)



