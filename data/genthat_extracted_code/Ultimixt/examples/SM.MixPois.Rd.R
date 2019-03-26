library(Ultimixt)


### Name: SM.MixPois
### Title: summary of the output produced by K.MixPois
### Aliases: SM.MixPois
### Keywords: summary statistics mixture parameters k-means clustering
###   method

### ** Examples

N=500
U =runif(N)                                            
xobs = rep(NA,N)
for(i in 1:N){
    if(U[i]<.6){
        xobs[i] = rpois(1,lambda=1)
    }else{
        xobs[i] = rpois(1,lambda=5)
    }
}
#estimate=K.MixPois(xobs, k=2, alpha0=.5, alpha=.5, Nsim=10000)
#SM.MixPois(estimate, xobs)
#plot(estimate[[8]][,1],estimate[[2]][,1],pch=19,col="skyblue",cex=0.5,xlab="lambda",ylab="p")
#points(estimate[[8]][,2], estimate[[2]][,2], pch=19, col="gold", cex=0.5)
#points(c(1,5), c(0.6,0.4), pch=19, cex=1)



