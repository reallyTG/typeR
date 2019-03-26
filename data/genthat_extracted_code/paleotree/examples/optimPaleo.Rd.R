library(paleotree)


### Name: optimPaleo
### Title: Simplified Optimizer for paleotree Likelihood Functions
### Aliases: optimPaleo

### ** Examples


# This function simply replicates optim() as shown below
    # where modelFun is the likelihood function

#optim(parInit(modelFun),modelFun,
#		lower = parLower(modelFun),upper = parUpper(modelFun), 
#		method = "L-BFGS-B",control = list(maxit = 1000000))



