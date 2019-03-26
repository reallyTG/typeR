library(poisson.glm.mix)


### Name: mylogLikePoisMix
### Title: Function to compute the loglikelihood of the mixture.
### Aliases: mylogLikePoisMix

### ** Examples

## This example computes the loglikelihood of a K = 10 component 
##      Poisson GLM mixture. The number of response variables is
##      d = 6, while the sample size equals to n = 5000. They are
##      stored in the array sim.data[,-1]. The number of covariates
##      equals 1 (corresponding to sim.data[,1]). We will use a 
##      random generation of the regression coefficients alpha and 
##      beta, in order to show that the loglikelihood can be computed 
##      without computational errors even in cases where the parameters
##      are quite ''bad'' for the data.   

data("simulated_data_15_components_bjk_full")
K <- 10
d <- 6
n <- dim(sim.data)[1]
condmean=vector("list",length=K)
weights<-rep(1,K)/K
ar<-array(data=NA,dim=c(n,d))
for (k in 1:K){
for (i in 1:d){
ar[,i]<-runif(n)+(1+0.1*(runif(n)-1))*sim.data[,1]}
condmean[[k]]<-ar}
mylogLikePoisMix(sim.data[,-1],condmean,weights)




