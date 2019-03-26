library(jagsUI)


### Name: pp.check
### Title: Posterior Predictive Checks for Bayesian Analyses fit in JAGS
### Aliases: pp.check

### ** Examples
  
#Analyze Longley economic data in JAGS
#Number employed as a function of GNP
#See ?jags for a more detailed example

#Get data
data(longley)
gnp <- longley$GNP
employed <- longley$Employed
n <- length(employed)
data <- list(gnp=gnp,employed=employed,n=n)

#Read in BUGS model file
#Note calculation of discrepancy stats fit and fit.new
#(sums of residuals)
writeLines("
model{

  #Likelihood
  for (i in 1:n){ 

    employed[i] ~ dnorm(mu[i], tau)     
    mu[i] <- alpha + beta*gnp[i]
    
    res[i] <- employed[i] - mu[i]   
    emp.new[i] ~ dnorm(mu[i], tau)
    res.new[i] <- emp.new[i] - mu[i]

  }
    
  #Priors
  alpha ~ dnorm(0, 0.00001)
  beta ~ dnorm(0, 0.00001)
  sigma ~ dunif(0,1000)
  tau <- pow(sigma,-2)
  
  #Derived parameters
  fit <- sum(res[])
  fit.new <- sum(res.new[])

}
", con="model.txt")

#Identify filepath of model file;
#in this case in the working directory
modfile <- 'model.txt'
  
#Set parameters to monitor
params <- c('alpha','beta','sigma','fit','fit.new')

#Run analysis

out <- jags(data = data,
            inits = NULL,
            parameters.to.save = params,
            model.file = modfile,
            n.chains = 3,
            n.adapt = 100,
            n.iter = 1000,
            n.burnin = 500,
            n.thin = 2)

#Examine output summary

out

#Posterior predictive check plot

pp.check(out, actual = 'fit', new = 'fit.new')




