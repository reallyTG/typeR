library(catR)


### Name: eapSem
### Title: Standard error of EAP ability estimation (dichotomous and
###   polytomous IRT models)
### Aliases: eapSem

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
 th <- eapEst(tcals, x)
 c(th, eapSem(th, tcals, x))

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- eapEst(tcals, x, priorDist = "unif", priorPar = c(-2, 2))
 c(th, eapSem(th, tcals, x, priorDist = "unif", priorPar=c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- eapEst(tcals, x, priorDist = "Jeffreys")
 c(th, eapSem(th, tcals, x, priorDist = "Jeffreys"))

## No test: 

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.GRM, model = "GRM")

 # EAP estimation, standard normal prior distribution
 th <- eapEst(m.GRM, x, model = "GRM")
 c(th, eapSem(th, m.GRM, x, model = "GRM"))

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- eapEst(m.GRM, x, model = "GRM", priorDist = "unif", priorPar = c(-2, 2))
 c(th, eapSem(th, m.GRM, x, model = "GRM", priorDist = "unif", priorPar = c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- eapEst(m.GRM, x, model = "GRM", priorDist = "Jeffreys")
 c(th, eapSem(th, m.GRM, x, model = "GRM", priorDist = "Jeffreys"))


# Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, cat_pav, model = "GPCM")

 # EAP estimation, standard normal prior distribution
 th <- eapEst(cat_pav, x, model = "GPCM")
 c(th, eapSem(th, cat_pav, x, model = "GPCM"))

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- eapEst(cat_pav, x, model = "GPCM", priorDist = "unif", priorPar = c(-2, 2))
 c(th, eapSem(th, cat_pav, x, model = "GPCM", priorDist = "unif", priorPar = c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- eapEst(cat_pav, x, model = "GPCM", priorDist = "Jeffreys")
 c(th, eapSem(th, cat_pav, x, model = "GPCM", priorDist = "Jeffreys"))
 
## End(No test)



