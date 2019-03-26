library(bayesSurv)


### Name: files2coda
### Title: Read the sampled values from the Bayesian survival regression
###   model to a coda mcmc object.
### Aliases: files2coda
### Keywords: connection

### ** Examples

## *** illustration of usage of parameters 'data.frames' and 'chain' ***
## *********************************************************************
## Two parallel chains with four variables, stored in data.frames
## data.frames are further stored in lists
library(coda)

group1 <- list();  group2 <- list();  group3 <- list()
    ## first chain of first two variables:
  group1[[1]] <- data.frame(var1 = rnorm(100, 0, 1), var2 = rnorm(100, 5, 4))
    ## second chain of first two variables:   
  group1[[2]] <- data.frame(var1 = rnorm(100, 0, 1), var2 = rnorm(100, 5, 4))
    ## first chain of the third variable:
  group2[[1]] <- data.frame(var3 = rgamma(100, 1, 1))
    ## second chain of the third variable:
  group2[[2]] <- data.frame(var3 = rgamma(100, 1, 1))
    ## first chain of the fourth variable:
  group3[[1]] <- data.frame(var4 = rbinom(100, 1, 0.4))
    ## second chain of the fourth variable:
  group3[[2]] <- data.frame(var4 = rbinom(100, 1, 0.4))  

  ## Create mcmc objects for each chain separately
mc.chain1 <- files2coda(data.frames = c("group1", "group2", "group3"), chain = 1)
mc.chain2 <- files2coda(data.frames = c("group1", "group2", "group3"), chain = 2)

  ## Create mcmc.list to represent two parallel chains
mc <- mcmc.list(mc.chain1, mc.chain2)
rm(mc.chain1, mc.chain2)


## *** illustration of usage of parameter 'data.frames' without 'chain' ***
## ************************************************************************
## Only one chain for four variables was sampled and stored in three data.frames
    ## chain of first two variables:
  group1 <- data.frame(var1 = rnorm(100, 0, 1), var2 = rnorm(100, 5, 4))
    ## chain of the third variable:  
  group2 <- data.frame(var3 = rgamma(100, 1, 1))
    ## chain of the fourth variable:
  group3 <- data.frame(var4 = rbinom(100, 1, 0.4))                        

  ## Create an mcmc object
mc <- files2coda(data.frames = c("group1", "group2", "group3"))



