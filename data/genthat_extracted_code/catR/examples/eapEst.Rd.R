library(catR)


### Name: eapEst
### Title: EAP ability estimation (dichotomous and polytomous IRT models)
### Aliases: eapEst

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Creation of a response pattern (tcals item parameters,
 # true ability level 0)
 set.seed(1)
 x <- genPattern(0, tcals)

 # EAP estimation, standard normal prior distribution
 eapEst(tcals, x)

 # EAP estimation, uniform prior distribution upon range [-2,2]
 eapEst(tcals, x, priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 eapEst(tcals, x, priorDist = "Jeffreys")

 # Changing the integration settings
 eapEst(tcals, x, nqp = 100)


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.GRM, model = "GRM")

 # EAP estimation, standard normal prior distribution
 eapEst(m.GRM, x, model = "GRM")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 eapEst(m.GRM, x, model = "GRM", priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 eapEst(m.GRM, x, model = "GRM", priorDist = "Jeffreys")


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, cat_pav, model = "GPCM")

 # EAP estimation, standard normal prior distribution
 eapEst(cat_pav, x, model = "GPCM")

 # EAP estimation, uniform prior distribution upon range [-2,2]
 eapEst(cat_pav, x, model = "GPCM", priorDist = "unif", priorPar = c(-2, 2))

 # EAP estimation, Jeffreys' prior distribution  
 eapEst(cat_pav, x, model = "GPCM", priorDist = "Jeffreys")
 


