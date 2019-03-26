library(mstR)


### Name: semTheta
### Title: Standard error of ability estimation (dichotomous and polytomous
###   models)
### Aliases: semTheta

### ** Examples


## Dichotomous models ##

 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.3PL)

 # ML estimation
 th <- thetaEst(m.3PL, x, method = "ML")
 c(th, semTheta(th, m.3PL, method = "ML"))

 # BM estimation, standard normal prior distribution
 th <- thetaEst(m.3PL, x)
 c(th, semTheta(th, m.3PL))

 # BM estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(m.3PL, x, method = "BM", priorDist = "unif",
                priorPar = c(-2, 2))
 c(th, semTheta(th, m.3PL, method = "BM", priorDist = "unif",
		    priorPar = c(-2, 2)))

 # BM estimation, Jeffreys' prior distribution  
 th <- thetaEst(m.3PL, x, method = "BM", priorDist = "Jeffreys")
 c(th, semTheta(th, m.3PL, method = "BM", priorDist = "Jeffreys"))

 # EAP estimation, standard normal prior distribution
 th <- thetaEst(m.3PL, x, method = "EAP")
 c(th, semTheta(th, m.3PL, x, method = "EAP"))

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(m.3PL, x, method = "EAP", priorDist = "unif",
                priorPar = c(-2, 2))
 c(th, semTheta(th, m.3PL, x, method = "EAP", priorDist = "unif",
		    priorPar = c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- thetaEst(m.3PL, x, method = "EAP", priorDist = "Jeffreys")
 c(th, semTheta(th, m.3PL, x, method = "EAP", priorDist = "Jeffreys"))

 # WL estimation
 th <- thetaEst(m.3PL, x, method = "WL")
 c(th, semTheta(th, m.3PL, method = "WL"))

 # 'fixed4' adjustment for constant pattern
 th <- thetaEst(m.3PL, rep(0, nrow(m.3PL)), constantPatt = "fixed4")
 c(th, semTheta(th, m.3PL, constantPatt = "fixed4"))

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
##D # ML estimation
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "ML")
##D  c(th, semTheta(th, m.GRM, model = "GRM", method = "ML"))
##D 
##D  # BM estimation, standard normal prior distribution
##D  th <- thetaEst(m.GRM, x, model = "GRM")
##D  c(th, semTheta(th, m.GRM, model = "GRM"))
##D 
##D  # BM estimation, uniform prior distribution upon range [-2,2]
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "unif", 
##D     priorPar = c(-2, 2))
##D  c(th, semTheta(th, m.GRM, model = "GRM", method = "BM", priorDist = "unif", 
##D   priorPar = c(-2, 2)))
##D 
##D  # BM estimation, Jeffreys' prior distribution  
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "Jeffreys")
##D  c(th, semTheta(th, m.GRM, model = "GRM", method = "BM", priorDist = "Jeffreys"))
##D 
##D  # EAP estimation, standard normal prior distribution
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP")
##D  c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP") )
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
##D     priorPar = c(-2, 2))
##D  c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
##D   priorPar = c(-2, 2)))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys")
##D  c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys"))
##D 
##D  # WL estimation
##D  th <- thetaEst(m.GRM, x, model = "GRM", method = "WL")
##D  c(th, semTheta(th, m.GRM, model = "GRM", method = "WL"))
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
##D # ML estimation
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "ML")
##D  c(th, semTheta(th, m.PCM, model = "PCM", method = "ML"))
##D 
##D  # BM estimation, standard normal prior distribution
##D  th <- thetaEst(m.PCM, x, model = "PCM")
##D  c(th, semTheta(th, m.PCM, model = "PCM"))
##D 
##D  # BM estimation, uniform prior distribution upon range [-2,2]
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "unif", 
##D     priorPar = c(-2, 2))
##D  c(th, semTheta(th, m.PCM, model = "PCM", method = "BM", priorDist = "unif", 
##D   priorPar = c(-2, 2)))
##D 
##D  # BM estimation, Jeffreys' prior distribution  
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "BM", priorDist = "Jeffreys")
##D  c(th, semTheta(th, m.PCM, model = "PCM", method = "BM", priorDist = "Jeffreys"))
##D 
##D  # EAP estimation, standard normal prior distribution
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "EAP")
##D  c(th, semTheta(th, m.PCM, x, model = "PCM", method = "EAP"))
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "unif", 
##D     priorPar = c(-2, 2))
##D  c(th, semTheta(th, m.PCM, x, model = "PCM", method = "EAP", priorDist = "unif", 
##D   priorPar = c(-2, 2)))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "EAP", priorDist = "Jeffreys")
##D  c(th, semTheta(th, m.PCM, x, model = "PCM", method = "EAP", priorDist = "Jeffreys"))
##D 
##D  # WL estimation
##D  th <- thetaEst(m.PCM, x, model = "PCM", method = "WL")
##D  c(th, semTheta(th, m.PCM, model = "PCM", method = "WL"))
##D  
## End(Not run)
 


