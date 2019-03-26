library(mma)


### Name: plot.mma
### Title: Relative effects plot of the fitted mma object
### Aliases: plot.mma

### ** Examples

data("weight_behavior")
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 temp.b.b.glm<-mma(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,n=2,n2=2)
plot(temp.b.b.glm,vari="exercises",xlim=c(0,50))
plot(temp.b.b.glm,vari="sports")



