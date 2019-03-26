library(evclust)


### Name: cecm
### Title: Constrained Evidential c-means algorithm
### Aliases: cecm

### ** Examples

## Generation of a two-class dataset
n<-30
x<-cbind(0.2*rnorm(n),rnorm(n))
y<-c(rep(1,n/2),rep(2,n/2))
x[(n/2+1):n,1]<-x[(n/2+1):n,1]+1
plot(x[,1],x[,2],asp=1,pch=y,col=y)
## Generation of 10 constraints
const<-create_MLCL(y,nbConst=10)
## Call of cecm
clus<-cecm(x=x,c=2,ML=const$M,CL=const$CL,delta=10)
plot(x[,1],x[,2],asp=1,pch=clus$y.pl,col=y)



