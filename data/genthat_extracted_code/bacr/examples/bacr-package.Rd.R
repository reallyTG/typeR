library(bacr)


### Name: bacr-package
### Title: Bayesian Adjustment for Confounding
### Aliases: bacr-package bacr
### Keywords: BAC

### ** Examples

######## Note that the example below is for illustration purpose only. ####
######## In practice, larger number of iterations will be needed.##########
##### simulate data ############
n = 200; m = 4
V = matrix(rnorm(n*m),ncol=m)
X = rbinom(n, size=1, prob=exp(V[,1])/(1+exp(V[,1])))
beta = c(1,1,1,0.5)
temp0 = cbind(rep(0,n), V[,1:3]) 
temp1 = cbind(rep(1,n), V[,1:3]) 
Y0 = rbinom(n, size=1, prob=exp(temp0)/(1+exp(temp0)))
Y1 = rbinom(n, size=1, prob=exp(temp1)/(1+exp(temp1)))
Y = Y0
Y[X==1] = Y1[X==1]
Z = as.data.frame(cbind(Y, X, V))
names(Z) = c("Y", "X", paste("V", 1:m, sep=""))
##### run BAC  ################# 
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=NULL, familyX="binomial", familyY="binomial", omega=Inf, 
            num_its=5, burnM=1, burnB=1, thin=1)
##### summarize results ########
summary(result)
plot(result)

### Adding interaction terms #############
beta = c(1,1,1,1,1)
temp0 = cbind(rep(0,n), V[,1:3], rep(0,n)*V[,3]) 
temp1 = cbind(rep(1,n), V[,1:3], rep(1,n)*V[,3]) 
Y0 = rbinom(n, size=1, prob=exp(temp0)/(1+exp(temp0)))
Y1 = rbinom(n, size=1, prob=exp(temp1)/(1+exp(temp1)))
Y = Y0
Y[X==1] = Y1[X==1]
Z = as.data.frame(cbind(Y, X, V))
names(Z) = c("Y", "X", paste("V", 1:m, sep=""))
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=paste("V", 1:m, sep=""), familyX="binomial", familyY="binomial", 
            omega=Inf, num_its=5, burnM=1, burnB=1, thin=1)
summary(result)
plot(result)

##### Estimate the ACE in the exposed subgroup  #################
result = bac(data=Z, exposure="X", outcome="Y", confounders=paste("V", 1:m, sep=""), 
            interactors=paste("V", 1:m, sep=""), familyX="binomial", familyY="binomial", 
            omega=Inf, num_its=5, burnM=1, burnB=1, thin=1, population=(X==1))
summary(result)
plot(result)



