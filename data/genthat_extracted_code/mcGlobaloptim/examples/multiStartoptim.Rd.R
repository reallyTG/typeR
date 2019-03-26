library(mcGlobaloptim)


### Name: multiStartoptim
### Title: Multistart global optimization using Monte Carlo and Quasi Monte
###   Carlo simulation.
### Aliases: multiStartoptim

### ** Examples

### Example from optim : 
# "wild" function, global minimum at about -15.81515
fw <- function (x)
{
  10*sin(0.3*x)*sin(1.3*x^2) + 0.00001*x^4 + 0.2*x+80
}
plot(fw, -50, 50, n = 1000, main = "optim() minimising 'wild function'")
(minfw <- multiStartoptim(objectivefn = fw, lower = -40, 
                          upper = 40, method = "nlminb", nbtrials = 500, 
                          typerunif = "sobol", verb = TRUE))
points(minfw$res$par, minfw$res$objective, pch = 8, lwd = 2, col = "red", cex = 2)

### Calibrating the Nelson-Siegel-Svensson model (from Gilli, Schumann (2010)) :
# Nelson - Siegel - Svensson model
NSS2 <- function(betaV, mats)
{
  gam1 <- mats / betaV [5]
  gam2 <- mats / betaV [6]
  aux1 <- 1 - exp (- gam1)
  aux2 <- 1 - exp (- gam2)
  betaV[1] + betaV[2] * (aux1 / gam1) +
    betaV[3] * (aux1 / gam1 + aux1 - 1) +
    betaV[4] * (aux2 / gam2 + aux2 - 1)
}

betaTRUE <- c(5, -2 ,5, -5 ,1 ,3)
mats <- c(1 ,3 ,6 ,9 ,12 ,15 ,18 ,21 ,24 ,30 ,36 ,48 ,60 ,72 ,84 ,
          96,108 ,120)/ 12
yM <- NSS2 (betaTRUE, mats)
dataList <- list ( yM = yM, mats = mats, model = NSS2)
plot (mats, yM, xlab = " maturities in years ", ylab =" yields in pct. ")

# define objective function
OF <- function (betaV, dataList) {
  mats <- dataList$mats
  yM <- dataList$yM
  model <- dataList$model
  y <- model(betaV, mats)
  aux <- y - yM
  crossprod(aux)
}

settings <- list (min = c( 0, -15, -30, -30 ,0 ,3), 
                  max = c (15, 30, 30, 30 ,3 ,6), d = 6)
NSStest <- multiStartoptim(objectivefn = OF, data = dataList, 
                           lower = settings$min, 
                           upper = settings$max, 
                           method = "nlminb", 
                           nbtrials = 50, typerunif = "torus")
lines(mats, NSS2(NSStest$par, mats), col = 'blue')

# (Only) when nbtrials is high, parallelization makes the computation faster. 
# Try a lower number of trials and compare the expressions with a timer. 
nbtrials <- 500
#t1 <- multiStartoptim(objectivefn = OF, data = dataList, 
#                      lower = settings$min, 
#                      upper = settings$max, 
#                      nbtrials = nbtrials,
#                      typerunif = "sobol", 
#                      method="nlminb",
#                      nbclusters=2)
t0 <- multiStartoptim(objectivefn = OF, data = dataList, 
                      lower = settings$min, 
                      upper = settings$max,
                      nbtrials=nbtrials, 
                      typerunif="sobol",  
                      method="nlminb")

#all.equal(t0, t1)



