library(mma)


### Name: summary.mma
### Title: Summary of an mma project
### Aliases: summary.mma print.summary.mma

### ** Examples

data("weight_behavior")
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
  temp.b.b.glm<-mma(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,n=2,n2=2)
 summary(temp.b.b.glm, RE=TRUE, ball.use=FALSE)
 summary(temp.b.b.glm, ball.use=FALSE)



