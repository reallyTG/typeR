library(catR)


### Name: GDI
### Title: Global-discrimination index (GDI) and posterior
###   global-discrimination index (GDIP) for item selection
### Aliases: GDI

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

 # GDI for item 1
 GDI(bank, 1, x, it.given)

 # GDIP for item 1
 GDI(bank, 1, x, it.given, type = "GDIP")

 # GDIP for item 1, different integration range
 GDI(bank, 1, x, it.given, type = "GDIP", lower = -2, upper = 2, nqp = 20)

 # GDIP for item 1, uniform prior distribution on the range [-2,2]
 GDI(bank, 1, x, it.given, type = "GDIP", priorDist = "unif", 
    priorPar = c(-2, 2))

 # Computation of likelihood function beforehand
 L <- function(th, r, param) 
  prod(Pi(th, param)$Pi^r * (1 - Pi(th,param)$Pi)^(1 - r))
 xx <- seq(from = -4, to = 4, length = 33)
 y <- sapply(xx, L, x, it.given) 
 GDI(bank, 1, x, it.given, X = xx, lik = y)
 


