library(mstR)


### Name: eapEst
### Title: EAP ability estimation (dichotomous and polytomous IRT models)
### Aliases: eapEst

### ** Examples


## Dichotomous models ##

 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.3PL)

 # EAP estimation, standard normal prior distribution
 eapEst(m.3PL, x)

 # EAP estimation, uniform prior distribution upon range [-2,2]
 eapEst(m.3PL, x, priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 eapEst(m.3PL, x, priorDist = "Jeffreys")

 # Changing the integration settings
 eapEst(m.3PL, x, nqp = 100)

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
##D  # EAP estimation, standard normal prior distribution
##D  eapEst(m.GRM, x, model = "GRM")
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  eapEst(m.GRM, x, model = "GRM", priorDist = "unif", priorPar = c(-2, 2))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  eapEst(m.GRM, x, model = "GRM", priorDist = "Jeffreys")
##D 
##D 
##D  # Generation of a item bank under PCM with 20 items and at most 3 categories
##D  m.PCM <- genPolyMatrix(20, 3, "PCM")
##D  m.PCM <- as.matrix(m.PCM)
##D 
##D  # Creation of a response pattern (true ability level 0)
##D  set.seed(1)
##D  x <- genPattern(0, m.PCM, model = "PCM")
##D 
##D  # EAP estimation, standard normal prior distribution
##D  eapEst(m.PCM, x, model = "PCM")
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  eapEst(m.PCM, x, model = "PCM", priorDist = "unif", priorPar = c(-2, 2))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  eapEst(m.PCM, x, model = "PCM", priorDist = "Jeffreys")
##D  
## End(Not run)
 


