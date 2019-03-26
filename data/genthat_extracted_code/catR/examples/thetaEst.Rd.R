library(catR)


### Name: thetaEst
### Title: Ability estimation (dichotomous and polytomous models)
### Aliases: thetaEst

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Creation of a response pattern (tcals item parameters, true ability level 0)
 set.seed(1)
 x <- genPattern(0, tcals)

 # ML estimation
 thetaEst(tcals, x, method = "ML")

 # With first two responses missing 
 x.mis <- x
 x.mis[1:2] <- NA
 thetaEst(tcals, x.mis, method = "ML")

 # BM estimation, standard normal prior distribution
 thetaEst(tcals, x)

 # BM estimation, uniform prior distribution upon range [-2,2]
 thetaEst(tcals, x, method = "BM", priorDist = "unif", priorPar = c(-2, 2))

 # BM estimation, Jeffreys' prior distribution  
 thetaEst(tcals, x, method = "BM", priorDist = "Jeffreys")

 # EAP estimation, standard normal prior distribution
 thetaEst(tcals, x, method = "EAP")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 thetaEst(tcals, x, method = "EAP", priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 thetaEst(tcals, x, method = "EAP", priorDist = "Jeffreys")

 # WL estimation
 thetaEst(tcals, x, method = "WL")

 # Robust estimation, Huber weight with tuning constant 1 (default)
 thetaEst(tcals, x, method = "ROB")

 # Robust estimation, Huber weight with tuning constant 2 
 thetaEst(tcals, x, method = "ROB", tuCo = 2)

 # Robust estimation, Tukey weight with tuning constant 4 
 thetaEst(tcals, x, method = "ROB", weight = "Tukey", tuCo = 4)

 # Creation of two constant patterns and estimation with WL, 
 # 'fixed4', 'fixed7' and 'var' stepsize adjustments
 x0 <- rep(0,nrow(tcals))
 x1 <- x0 + 1
 thetaEst(tcals, x0, constantPatt = "WL") # equivalent to thetaEst(tcals, x0, method = "WL")
 thetaEst(tcals, x1, constantPatt = "WL") # equivalent to thetaEst(tcals, x1, method = "WL")
 thetaEst(tcals, x0, constantPatt = "fixed4") 
 thetaEst(tcals, x1, constantPatt = "fixed4") 
 thetaEst(tcals, x0, constantPatt = "fixed7") 
 thetaEst(tcals, x1, constantPatt = "fixed7") 
 thetaEst(tcals, x0, constantPatt = "var") 
 thetaEst(tcals, x1, constantPatt = "var") 

## No test: 

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.GRM, model = "GRM")

 # ML estimation
 thetaEst(m.GRM, x, model = "GRM", method = "ML")

 # BM estimation, standard normal prior distribution
 thetaEst(m.GRM, x, model = "GRM")

 # BM estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "unif", 
          priorPar = c(-2, 2))

 # BM estimation, Jeffreys' prior distribution  
 thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "Jeffreys")

 # EAP estimation, standard normal prior distribution
 thetaEst(m.GRM, x, model = "GRM", method = "EAP")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
          priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys")

 # WL estimation
 thetaEst(m.GRM, x, model = "GRM", method = "WL")


 # Generation of an item bank under PCM with 20 items and 4 categories
 m.PCM <- genPolyMatrix(20, 4, "PCM", same.nrCat = TRUE)
 m.PCM <- as.matrix(m.PCM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.PCM, model = "PCM")

 # ML estimation
 thetaEst(m.PCM, x, model = "PCM", method = "ML")

 # BM estimation, standard normal prior distribution
 thetaEst(m.PCM, x, model = "PCM")

 # BM estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "unif", 
          priorPar = c(-2, 2))

 # BM estimation, Jeffreys' prior distribution  
 thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "Jeffreys")

 # EAP estimation, standard normal prior distribution
 thetaEst(m.PCM, x, model = "PCM", method = "EAP")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "unif", 
          priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "Jeffreys")

 # WL estimation
 thetaEst(m.PCM, x, model = "PCM", method = "WL")
 
## End(No test)



