library(mstR)


### Name: thetaEst
### Title: Ability estimation (dichotomous and polytomous models)
### Aliases: thetaEst

### ** Examples


## Dichotomous models ##

 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)


 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.3PL)

 # ML estimation
 thetaEst(m.3PL, x, method = "ML")

 # BM estimation, standard normal prior distribution
 thetaEst(m.3PL, x)

 # BM estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.3PL, x, method = "BM", priorDist = "unif", priorPar = c(-2, 2))

 # BM estimation, Jeffreys' prior distribution  
 thetaEst(m.3PL, x, method = "BM", priorDist = "Jeffreys")

 # EAP estimation, standard normal prior distribution
 thetaEst(m.3PL, x, method = "EAP")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 thetaEst(m.3PL, x, method = "EAP", priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 thetaEst(m.3PL, x, method = "EAP", priorDist = "Jeffreys")

 # WL estimation
 thetaEst(m.3PL, x, method = "WL")

 # Creation of two constant patterns and estimation with WL, 
 # 'fixed4', 'fixed7' and 'var' stepsize adjustments
 x0 <- rep(0,nrow(m.3PL))
 x1 <- x0 + 1
 thetaEst(m.3PL, x0, constantPatt = "WL") # equivalent to thetaEst(m.3PL, x0, method = "WL")
 thetaEst(m.3PL, x1, constantPatt = "WL") # equivalent to thetaEst(m.3PL, x1, method = "WL")
 thetaEst(m.3PL, x0, constantPatt = "fixed4") 
 thetaEst(m.3PL, x1, constantPatt = "fixed4") 
 thetaEst(m.3PL, x0, constantPatt = "fixed7") 
 thetaEst(m.3PL, x1, constantPatt = "fixed7") 
 thetaEst(m.3PL, x0, constantPatt = "var") 
 thetaEst(m.3PL, x1, constantPatt = "var") 

## Not run: 
##D 
##D ## Polytomous models ##
##D 
##D  # Generation of an item bank under GRM with 100 items and at most 4 categories
##D  m.GRM <- genPolyMatrix(100, 4, "GRM")
##D  m.GRM <- as.matrix(m.GRM)
##D 
##D  # Creation of a response pattern (true ability level 0)
##D  set.seed(1)
##D  x <- genPattern(0, m.GRM, model = "GRM")
##D 
##D  # ML estimation
##D  thetaEst(m.GRM, x, model = "GRM", method = "ML")
##D 
##D  # BM estimation, standard normal prior distribution
##D  thetaEst(m.GRM, x, model = "GRM")
##D 
##D  # BM estimation, uniform prior distribution upon range [-2,2]
##D  thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "unif", 
##D           priorPar = c(-2, 2))
##D 
##D  # BM estimation, Jeffreys' prior distribution  
##D  thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "Jeffreys")
##D 
##D  # EAP estimation, standard normal prior distribution
##D  thetaEst(m.GRM, x, model = "GRM", method = "EAP")
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
##D           priorPar = c(-2, 2))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys")
##D 
##D  # WL estimation
##D  thetaEst(m.GRM, x, model = "GRM", method = "WL")
##D 
##D 
##D  # Generation of an item bank under PCM with 20 items and 4 categories
##D  m.PCM <- genPolyMatrix(20, 4, "PCM", same.nrCat = TRUE)
##D  m.PCM <- as.matrix(m.PCM)
##D 
##D  # Creation of a response pattern (true ability level 0)
##D  set.seed(1)
##D  x <- genPattern(0, m.PCM, model = "PCM")
##D 
##D  # ML estimation
##D  thetaEst(m.PCM, x, model = "PCM", method = "ML")
##D 
##D  # BM estimation, standard normal prior distribution
##D  thetaEst(m.PCM, x, model = "PCM")
##D 
##D  # BM estimation, uniform prior distribution upon range [-2,2]
##D  thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "unif", 
##D           priorPar = c(-2, 2))
##D 
##D  # BM estimation, Jeffreys' prior distribution  
##D  thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "Jeffreys")
##D 
##D  # EAP estimation, standard normal prior distribution
##D  thetaEst(m.PCM, x, model = "PCM", method = "EAP")
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "unif", 
##D           priorPar = c(-2, 2))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "Jeffreys")
##D 
##D  # WL estimation
##D  thetaEst(m.PCM, x, model = "PCM", method = "WL")
##D  
## End(Not run)
 


