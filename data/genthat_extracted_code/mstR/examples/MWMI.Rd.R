library(mstR)


### Name: MWMI
### Title: Maximum likelihood weighted module information (MLWMI) and
###   maximum posterior weighted module information (MPWMI)
### Aliases: MWMI

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

 # Creation of the response pattern for module 1 and true ability level 0
 x <- genPattern(th = 0, it = it[1:8,], seed = 1)

 # MLWMI for module 3
 MWMI(it, modules, target.mod = 3, it.given = 1:8, x = x)

 # MPWMI for module 3
 MWMI(it, modules, target.mod = 3, it.given = 1:8, x = x, type = "MPWMI")

 # MLWMI for for module 3, different integration range
 MWMI(it, modules, target.mod = 3, it.given = 1:8, x = x, lower = -2, upper = 2, nqp = 20)

 # MPWI for module 3, uniform prior distribution on the range [-2,2]
 MWMI(it, modules, target.mod = 3, it.given = 1:8, x = x, type = "MPWMI", 
     priorDist = "unif", priorPar = c(-2, 2))


## Polytomous models ##

 # Same structure as above but parameters are now generated from PCM with at most
 # 4 categories
 it.pol <- genPolyMatrix(55, model = "PCM", nrCat = 4)
 it.pol <- as.matrix(it)

 # Creation of the response pattern for module 1 and true ability level 0
 x <- genPattern(th = 0, it = it.pol[1:8,], seed = 1)

# MLWMI for module 3
 MWMI(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, model = "PCM")

 # MPWMI for module 3
 MWMI(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, type = "MPWMI", 
     model = "PCM")

 # MLWMI for for module 3, different integration range
 MWMI(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, lower = -2, 
     upper = 2, nqp = 20, model = "PCM")

 # MPWI for module 3, uniform prior distribution on the range [-2,2]
 MWMI(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, type = "MPWMI", 
     priorDist = "unif", priorPar = c(-2, 2), model = "PCM")
 


