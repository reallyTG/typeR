library(catR)


### Name: KL
### Title: Kullback-Leibler (KL) and posterior Kullback-Leibler (KLP)
###   values for item selection
### Aliases: KL

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 bank <- as.matrix(tcals[,1:4])
 
 # Selection of two arbitrary items (15 and 20) of the
 # 'tcals' data set
 it.given <- bank[c(15, 20),]

 # Creation of a response pattern
 x <- c(0, 1)

 # KL for item 1, ML estimate of ability computed
 KL(bank, 1, x, it.given)

 # Current (ML) ability estimate 
 theta <- thetaEst(it.given, x, method = "ML")
 KL(bank, 1, x, it.given, theta = theta)

 # WL ability estimate instead
 theta <- thetaEst(it.given, x, method = "WL")
 KL(bank, 1, x, it.given, theta = theta)

 # KLP for item 1
 KL(bank, 1, x, it.given, theta = theta, type = "KLP")

 # KLP for item 1, different integration range
 KL(bank, 1, x, it.given, theta = theta, type = "KLP", lower = -2, upper = 2, nqp = 20)

 # KL for item 1, uniform prior distribution on the range [-2,2]
 KL(bank, 1, x, it.given, theta = theta, type = "KLP", priorDist = "unif", 
    priorPar = c(-2, 2))

 # Computation of likelihood function beforehand
 L <- function(th, r, param) 
  prod(Pi(th, param)$Pi^r * (1 - Pi(th,param)$Pi)^(1 - r))
 xx <- seq(from = -4, to = 4, length = 33)
 y <- sapply(xx, L, x, it.given) 
 KL(bank, 1, x, it.given, theta = theta, X = xx, lik = y)


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- m.GRM[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GRM")

 # KL for item 1, ML estimate of ability computed
 KL(m.GRM, 1, x, it.given, model = "GRM")

 # Current (ML) ability estimate 
 theta <- thetaEst(it.given, x, method = "ML", model = "GRM")
 KL(m.GRM, 1, x, it.given, theta = theta, model = "GRM")

 # WL ability estimate instead
 theta <- thetaEst(it.given, x, method = "WL", model = "GRM")
 KL(m.GRM, 1, x, it.given, theta = theta, model = "GRM")

 # KLP for item 1
 KL(m.GRM, 1, x, it.given, theta = theta, model = "GRM", type = "KLP")

 # KLP for item 1, different integration range
 KL(m.GRM, 1, x, it.given, theta = theta, model = "GRM", type = "KLP", lower = -2, 
    upper = 2, nqp = 20)

 # KL for item 1, uniform prior distribution on the range [-2,2]
 KL(m.GRM, 1, x, it.given, theta = theta, model = "GRM", type = "KLP", 
    priorDist = "unif", priorPar = c(-2, 2))


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- cat_pav[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GPCM")

  # KL for item 1, ML estimate of ability computed
 KL(cat_pav, 1, x, it.given, model = "GPCM")

 # Current (ML) ability estimate 
 theta <- thetaEst(it.given, x, method = "ML", model = "GPCM")
 KL(cat_pav, 1, x, it.given, theta = theta, model = "GPCM")

 # WL ability estimate instead
 theta <- thetaEst(it.given, x, method = "WL", model = "GPCM")
 KL(cat_pav, 1, x, it.given, theta = theta, model = "GPCM")

 # KLP for item 1
 KL(cat_pav, 1, x, it.given, theta = theta, model = "GPCM", type = "KLP")

 # KLP for item 1, different integration range
 KL(cat_pav, 1, x, it.given, theta = theta, model = "GPCM", type = "KLP", lower = -2, 
    upper = 2, nqp = 20)

 # KL for item 1, uniform prior distribution on the range [-2,2]
 KL(cat_pav, 1, x, it.given, theta = theta, model = "GPCM", type = "KLP", 
    priorDist = "unif", priorPar = c(-2, 2))
 


