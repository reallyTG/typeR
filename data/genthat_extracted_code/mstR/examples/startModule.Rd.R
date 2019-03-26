library(mstR)


### Name: startModule
### Title: Selection of the first module in MST
### Aliases: startModule

### ** Examples


## Dichotomous models ##

 # Generation of an item bank under 2PL, made of 7 successive modules that target
 # different average ability levels and with different lengths
 # (the first generated item parameters hold two modules of 8 items each)
 it <- rbind(genDichoMatrix(16, model = "2PL"),
             genDichoMatrix(6, model = "2PL", bPrior = c("norm", -1, 1)),
             genDichoMatrix(6, model = "2PL", bPrior = c("norm", 1, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", -2, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", 0, 1)),
             genDichoMatrix(9, model = "2PL", bPrior = c("norm", 2, 1)))
 it <- as.matrix(it)

 # Creation of the 'module' matrix to list item membership in each module
 modules <- matrix(0, 55, 7)
 modules[1:8, 1] <- modules[9:16, 2] <- modules[17:22, 3] <- 1
 modules[23:28, 4] <- modules[29:37, 5] <- modules[38:46, 6] <- 1
 modules[47:55, 7] <- 1

 # Creation of the transition matrix to define a 1-2-3 MST
trans <- matrix(0, 7, 7)
trans[1, 3:4] <- trans[2, 3:4] <- trans[3, 5:6] <- trans[4, 6:7] <- 1

 # Selection of module 2 as starting module
 startModule(it, modules, trans, fixModule = 2)
 
## Not run: 
##D 
##D  # Selection of module 3 (not from stage 1 => mistake)
##D  startModule(it, modules, trans, fixModule = 3)
## End(Not run)

 # Random selection of starting module 
 startModule(it, modules, trans, seed = 1)

 # Selection by maximizing information at ability level 0
 startModule(it, modules, trans, theta = 0)


## Polytomous models ##

 # Same structure as above but parameters are now generated from PCM with at most
 # 4 categories
 it <- genPolyMatrix(55, model = "PCM", nrCat = 4)
 it <- as.matrix(it)

 # Selection of module 2 as starting module
 startModule(it, modules, trans, fixModule = 2, model = "PCM")
 
## Not run: 
##D 
##D  # Selection of module 3 (not from stage 1 => mistake)
##D  startModule(it, modules, trans, fixModule = 3, model = "PCM")
## End(Not run)

 # Random selection of starting module 
 startModule(it, modules, trans, seed = 1, model = "PCM")

 # Selection by maximizing information at ability level 0
 startModule(it, modules, trans, theta = 0, model = "PCM")
 


