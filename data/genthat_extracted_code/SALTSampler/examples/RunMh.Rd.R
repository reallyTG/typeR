library(SALTSampler)


### Name: RunMh
### Title: Metropolis Hasting Algorithm Constrained on a Simplex
### Aliases: RunMh

### ** Examples

###Dirichlet sampling in 3-simplex
dir <- RunMh(center = c(0.7, 0.2, 0.1), B = 2e3, concentration = 10,
                        h = c(2, 2, 2), type = 'dirichlet', dat = NULL)
                        
####Multinomial sampling                  
## Not run: 
##D sampData <- GenData(center = c(0.2, 0.3, 0.5), n = 100, size = 10)
##D multinom <- RunMh(center = c(0.2, 0.3, 0.5), B = 1e4, h = c(2,2,2), 
##D                   type = 'multinom', dat = sampData)
## End(Not run)

####User-defined target distribution for a calibration problem 
## Not run: 
##D #Known function which we want to calibrate
##D CalibFn <- function(y, logit = FALSE) {
##D   if (logit == TRUE) {
##D     y <- exp(LogPq(y)$logp)
##D   }
##D   out <- 1e3*y[1]^3*y[2]^3/sqrt(20 + y[3])
##D   return(out)
##D }
##D 
##D #Generate data 
##D z <- rnorm(n = 1000, mean = CalibFn(c(1/3, 1/3, 1/3), 2))
##D 
##D #User defined target distribution
##D Target <- function(ycand, ycurrent, a, dat, pars = NULL) {
##D   out <- sum(dnorm(dat, CalibFn(ycand, logit = TRUE), 2, log = TRUE)) - 
##D     sum(dnorm(dat, CalibFn(ycurrent, logit = TRUE), 2, log = TRUE)) + 
##D     sum((a - 1)*(LogPq(ycand)$logp - LogPq(ycurrent)$logp))
##D   return(out)
##D } 
##D 
##D #Run sampler
##D inputDist <- RunMh(center = c(1/3, 1/3, 1/3), B = 3e4, concentration = 3, 
##D                    h = c(0.2, 0.2, 0.2), type = 'user', dat = z)
## End(Not run)



