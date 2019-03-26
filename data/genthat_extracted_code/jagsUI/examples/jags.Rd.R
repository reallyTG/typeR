library(jagsUI)


### Name: jags
### Title: Call JAGS from R
### Aliases: jagsUI-class jags jagsUI

### ** Examples
  
#Analyze Longley economic data in JAGS
  
#Number employed as a function of GNP
  
######################################
##   1. Collect and Package Data    ##
######################################
  
#Load data (built into R)
  
data(longley)
head(longley)
  
#Separate data objects
  
gnp <- longley$GNP
employed <- longley$Employed
n <- length(employed)

#Input data objects must be numeric, and must be
#scalars, vectors, matrices, or arrays.
  
#Package together: several possible ways
  
#1. A named list of the objects
data <- list(gnp=gnp,employed=employed,n=n)
  
#2. A character vector of the names of the objects
data <- c('gnp','employed','n')
  
#3. A list of names of the objects
data <- list('gnp','employed','n')
  
######################################
##      2. Write model file         ##
######################################

#Write a model in the BUGS language

#Generate model file directly in R
#(could also read in existing model file)

writeLines("
model{

  #Likelihood
  for (i in 1:n){ 

    employed[i] ~ dnorm(mu[i], tau)     
    mu[i] <- alpha + beta*gnp[i]

  }
    
  #Priors
  alpha ~ dnorm(0, 0.00001)
  beta ~ dnorm(0, 0.00001)
  sigma ~ dunif(0,1000)
  tau <- pow(sigma,-2)

}
", con="model.txt")

#Identify filepath of model file;
#in this case in the working directory
modfile <- 'model.txt'
  
######################################
##    3. Initialize Parameters      ##
######################################
  
#Best to generate initial values using function

inits <- function(){  
  list(alpha=rnorm(1,0,1),beta=rnorm(1,0,1),sigma=runif(1,0,3))  
}
  
#In many cases, JAGS can pick initial values automatically;
#you can leave argument inits=NULL to allow this.

######################################
##  4. Set parameters to monitor    ##
######################################

#Choose parameters you want to save output for
#Only parameters in this list will appear in output object
#(deviance is added automatically if DIC=TRUE)

#List must be specified as a character vector

params <- c('alpha','beta','sigma')

######################################
##        5. Run Analysis           ##
######################################

#Call jags function; specify number of chains, number of adaptive iterations,
#the length of the burn-in period, total iterations, and the thin rate.

out <- jags(data = data,
            inits = inits,
            parameters.to.save = params,
            model.file = modfile,
            n.chains = 3,
            n.adapt = 100,
            n.iter = 1000,
            n.burnin = 500,
            n.thin = 2)

#Arguments will be passed to JAGS; you will see progress bars
#and other information

#Examine output summary

out

#Look at output object elements
names(out)

#Plot traces and posterior densities
plot(out)

#Plot traces
traceplot(out)

#Update model another 1000 iterations
out <- update(out,n.iter = 1000)




