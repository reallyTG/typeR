library(mstR)


### Name: MKL
### Title: Module Kullback-Leibler (MKL) and posterior module
###   Kullback-Leibler (MKLP)
### Aliases: MKL

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

 # MKL for module 3
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x)

 # Same with pre-estimation of ability by ML (same result)
 th <- thetaEst(it[1:8,], x, method = "ML") 
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x, theta = th)

 # Same with pre-estimation of ability by EAP (different result)
 th <- thetaEst(it[1:8,], x, method = "EAP") 
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x, theta = th)

 # MKLP for module 3
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x, type = "MKLP")

 # MKL for for module 3, different integration range
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x, lower = -2, upper = 2, nqp = 20)

 # MKLP for module 3, uniform prior distribution on the range [-2,2]
 MKL(it, modules, target.mod = 3, it.given = 1:8, x = x, type = "MKLP", 
     priorDist = "unif", priorPar = c(-2, 2))


## Polytomous models ##

 # Same structure as above but parameters are now generated from PCM with at most
 # 4 categories
 it.pol <- genPolyMatrix(55, model = "PCM", nrCat = 4)
 it.pol <- as.matrix(it)

 # Creation of the response pattern for module 1 and true ability level 0
 x <- genPattern(th = 0, it = it.pol[1:8,], seed = 1)

# MKL for module 3
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, model = "PCM")

 # Same with pre-estimation of ability by ML (same result)
 th <- thetaEst(it.pol[1:8,], x, method = "ML", model = "PCM") 
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, theta = th, 
     model = "PCM")

 # Same with pre-estimation of ability by EAP (different result)
 th <- thetaEst(it.pol[1:8,], x, method = "EAP", model = "PCM") 
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, theta = th, 
     model = "PCM")

 # MKLP for module 3
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, type = "MKLP", 
     model = "PCM")

 # MKL for for module 3, different integration range
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, lower = -2, 
     upper = 2, nqp = 20, model = "PCM")

 # MKLP for module 3, uniform prior distribution on the range [-2,2]
 MKL(it.pol, modules, target.mod = 3, it.given = 1:8, x = x, type = "MKLP", 
     priorDist = "unif", priorPar = c(-2, 2), model = "PCM")
 


