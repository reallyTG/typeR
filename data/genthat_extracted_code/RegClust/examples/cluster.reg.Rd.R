library(RegClust)


### Name: cluster.reg
### Title: Clustering analysis of regression coefficients.
### Aliases: cluster.reg
### Keywords: regression EM algorithm clustering

### ** Examples

## Not run: 
##D beta0=1
##D beta1=0.02
##D beta2=-0.04
##D beta3=0.1
##D set.seed(1234)
##D sim=200
##D age=runif(sim, min=18, max=70)
##D Rerror=rnorm(sim,-3,3)
##D 
##D y1=matrix(NA,sim,4,dimnames = list(NULL,c("y1", "y2", "y3", "y4")))
##D for (g in 1:4){
##D set.seed(1234)
##D y1[,g]=beta0+beta1*runif(sim, min=18, max=70)+beta1*rnorm(sim,-3,3)
##D set.seed(1134+g)
##D y1[,g]=y1[,g]+rnorm(sim,0,1)
##D }
##D y2=matrix(NA,sim,5,dimnames = list(NULL,c("y5", "y6", "y7","y8","y9")))
##D for (g in 1:5){
##D set.seed(1234)
##D y2[,g]=beta0+beta2*runif(sim, min=18, max=70)+beta2*rnorm(sim,-3,3)
##D set.seed(2234+g)
##D y2[,g]=y2[,g]+rnorm(sim,0,0.5^0.5)
##D }
##D y3=matrix(NA,sim,6,dimnames = list(NULL,c("y10", "y11", "y12","y13","y14","y15")))
##D for (g in 1:6){
##D set.seed(1234)
##D y3[,g]=beta0+beta3*runif(sim, min=18, max=70)+beta3*rnorm(sim,-3,3)
##D set.seed(3334+g)
##D y3[,g]=y3[,g]+rnorm(sim,0,1)
##D }
##D X=data.frame(round(cbind(Rerror=Rerror,age=age),2))
##D Y=data.frame(round(cbind(y1,y2,y3),2))
##D 
##D run<-cluster.reg(Y,X)
##D run
## End(Not run)



