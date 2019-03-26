library(mma)


### Name: print.mma
### Title: Print a mma object
### Aliases: print.mma

### ** Examples

 data("weight_behavior")
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 temp.b.b.glm<-mma(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,n=2,n2=2)
 print(temp.b.b.glm,digit=8)



