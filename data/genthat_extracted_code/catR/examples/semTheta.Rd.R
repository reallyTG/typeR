library(catR)


### Name: semTheta
### Title: Standard error of ability estimation (dichotomous and polytomous
###   models)
### Aliases: semTheta

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)
 
 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])

 # Creation of a response pattern (tcals item parameters, true ability level 0)
 x <- genPattern(0, tcals, seed = 1)

 # ML estimation
 th <- thetaEst(tcals, x, method = "ML")
 c(th, semTheta(th, tcals, method = "ML"))

 # ML estimation, new ASE formula (=> yields the same result)
 c(th, semTheta(th, tcals, method = "ML", sem.type = "new"))

 # With first two responses missing
 x.mis <- x
 x.mis[1:2] <- NA
 th <- thetaEst(tcals, x.mis, method = "ML")
 c(th, semTheta(th, tcals, x.mis, method = "ML"))

 # BM estimation, standard normal prior distribution
 th <- thetaEst(tcals, x)
 c(th, semTheta(th, tcals))

 # BM estimation and new ASE formula
 c(th, semTheta(th, tcals, sem.type = "new"))

 # BM estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(tcals, x, method = "BM", priorDist = "unif",
                priorPar = c(-2, 2))
 c(th, semTheta(th, tcals, method = "BM", priorDist = "unif",
		    priorPar = c(-2, 2)))

 # BM estimation, Jeffreys' prior distribution  
 th <- thetaEst(tcals, x, method = "BM", priorDist = "Jeffreys")
 c(th, semTheta(th, tcals, method = "BM", priorDist = "Jeffreys"))

 # EAP estimation, standard normal prior distribution
 th <- thetaEst(tcals, x, method = "EAP")
 c(th, semTheta(th, tcals, x, method = "EAP"))

## Not run: 
##D 
##D  # EAP estimation, uniform prior distribution upon range [-2,2]
##D  th <- thetaEst(tcals, x, method = "EAP", priorDist = "unif",
##D                 priorPar = c(-2, 2))
##D  c(th, semTheta(th, tcals, x, method = "EAP", priorDist = "unif",
##D 		    priorPar = c(-2, 2)))
##D 
##D  # EAP estimation, Jeffreys' prior distribution  
##D  th <- thetaEst(tcals, x, method = "EAP", priorDist = "Jeffreys")
##D  c(th, semTheta(th, tcals, x, method = "EAP", priorDist = "Jeffreys"))
##D 
##D  # WL estimation
##D  th <- thetaEst(tcals, x, method = "WL")
##D  c(th, semTheta(th, tcals, method = "WL"))
##D 
##D  # WL estimation, new ASE formula
##D  c(th, semTheta(th, tcals, method = "WL", sem.type = "new"))
##D 
##D  # 'fixed4' adjustment for constant pattern
##D  th <- thetaEst(tcals, rep(0, nrow(tcals)), constantPatt = "fixed4")
##D  c(th, semTheta(th, tcals, constantPatt = "fixed4"))
##D 
##D  # Robust estimation
##D  th <- thetaEst(tcals, x, method = "ROB")
##D  c(th, semTheta(th, tcals, method = "ROB"))
##D 
##D  # Robust estimation, Huber weight and tuning constant 2
##D  th <- thetaEst(tcals, x, method = "ROB", tuCo = 2)
##D  c(th, semTheta(th, tcals, method = "ROB", tuCo = 2))
##D 
##D  # Robust estimation, Tukey weight and tuning constant 4
##D  th <- thetaEst(tcals, x, method = "ROB", weight = "Tukey", tuCo = 4)
##D  c(th, semTheta(th, tcals, method = "ROB", weight = "Tukey", tuCo = 4))
##D 
##D  ## Exact SE computation under 1PL model: 
##D  # Creation of a 1PL item bank with difficulties from 'tcals' (85 items)
##D  tcals2 <- cbind(1, tcals[, 2],  0, 1)
##D 
##D  # Pattern generation for true ability level 1
##D  x2 <- genPattern(1, tcals2, seed = 1)
##D 
##D  # ML estimation
##D  th2 <- thetaEst(tcals2, x2, method = "ML")
##D  c(th2, semTheta(th2, tcals2, x2, method = "ML", sem.exact = TRUE))
##D 
##D  # ML estimation, true SE in addition
##D  c(th2, semTheta(th2, tcals2, x2, method = "ML", sem.exact = TRUE, trueTh = 1))
##D 
##D  ## Exact SE computation under 2PL model: 
##D  # Creation of a 2PL item bank with ten items
##D  it <- genDichoMatrix(10, model = "2PL", seed = 1)
##D 
##D  # Pattern generation for true ability level 1
##D  x3 <- genPattern(1, it, seed = 1)
##D 
##D  # ML estimation
##D  th3 <- thetaEst(it, x3, method = "ML")
##D  c(th3, semTheta(th3, it, x3, method = "ML", sem.exact = TRUE))
##D 
##D  # ML estimation, true SE in addition
##D  c(th3, semTheta(th3, it, x3, method = "ML", sem.exact = TRUE, trueTh = 1))
## End(Not run)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.GRM, model = "GRM")

# ML estimation
 th <- thetaEst(m.GRM, x, model = "GRM", method = "ML")
 c(th, semTheta(th, m.GRM, model = "GRM", method = "ML"))

 # BM estimation, standard normal prior distribution
 th <- thetaEst(m.GRM, x, model = "GRM")
 c(th, semTheta(th, m.GRM, model = "GRM"))

 # BM estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "unif", 
    priorPar = c(-2, 2))
 c(th, semTheta(th, m.GRM, model = "GRM", method = "BM", priorDist = "unif", 
  priorPar = c(-2, 2)))

 # BM estimation, Jeffreys' prior distribution  
 th <- thetaEst(m.GRM, x, model = "GRM", method = "BM", priorDist = "Jeffreys")
 c(th, semTheta(th, m.GRM, model = "GRM", method = "BM", priorDist = "Jeffreys"))

 # EAP estimation, standard normal prior distribution
 th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP")
 c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP") )

## No test: 

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
    priorPar = c(-2, 2))
 c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP", priorDist = "unif", 
  priorPar = c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- thetaEst(m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys")
 c(th, semTheta(th, m.GRM, x, model = "GRM", method = "EAP", priorDist = "Jeffreys"))

 # WL estimation
 th <- thetaEst(m.GRM, x, model = "GRM", method = "WL")
 c(th, semTheta(th, m.GRM, model = "GRM", method = "WL"))


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, cat_pav, model = "GPCM")

# ML estimation
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "ML")
 c(th, semTheta(th, cat_pav, model = "GPCM", method = "ML"))

 # BM estimation, standard normal prior distribution
 th <- thetaEst(cat_pav, x, model = "GPCM")
 c(th, semTheta(th, cat_pav, model = "GPCM"))

 # BM estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "BM", priorDist = "unif", 
    priorPar = c(-2, 2))
 c(th, semTheta(th, cat_pav, model = "GPCM", method = "BM", priorDist = "unif", 
  priorPar = c(-2, 2)))

 # BM estimation, Jeffreys' prior distribution  
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "BM", priorDist = "Jeffreys")
 c(th, semTheta(th, cat_pav, model = "GPCM", method = "BM", priorDist = "Jeffreys"))

 # EAP estimation, standard normal prior distribution
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "EAP")
 c(th, semTheta(th, cat_pav, x, model = "GPCM", method = "EAP"))

 # EAP estimation, uniform prior distribution upon range [-2,2]
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "EAP", priorDist = "unif", 
    priorPar = c(-2, 2))
 c(th, semTheta(th, cat_pav, x, model = "GPCM", method = "EAP", priorDist = "unif", 
  priorPar = c(-2, 2)))

 # EAP estimation, Jeffreys' prior distribution  
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "EAP", priorDist = "Jeffreys")
 c(th, semTheta(th, cat_pav, x, model = "GPCM", method = "EAP", priorDist = "Jeffreys"))

 # WL estimation
 th <- thetaEst(cat_pav, x, model = "GPCM", method = "WL")
 c(th, semTheta(th, cat_pav, model = "GPCM", method = "WL"))
## End(No test)
 


