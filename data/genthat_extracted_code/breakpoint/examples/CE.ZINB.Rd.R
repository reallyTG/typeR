library(breakpoint)


### Name: CE.ZINB
### Title: Multiple Break-point Detection via the CE Method with
###   Zero-Inflated Negative Binomial Distribution
### Aliases: CE.ZINB

### ** Examples

#### Simulated data example ###
# gamlss R package is used to simulate data from the ZINB.

## Not run: 
##D library(gamlss)
##D segs <- 6 # Number of segements
##D M <- c(1500, 2200, 800, 2500, 1000, 2000) # Segment width
##D #true.locations <- c(1501, 3701, 4501, 7001, 8001)  # True break-point locations 
##D seg <- NULL
##D p <- c(0.6, 0.1, 0.3, 0.05, 0.2, 0.4) # Specification of p's on each segment'
##D sigma.val <- c(1,2,3,4,5,6) # Specification of sigma vlaues 
##D 
##D for(j in 1:segs){
##D   seg <- c(seg, rZINBI(M[j], mu = 300, sigma = sigma.val[j], nu = p[j]))
##D }
##D 
##D simdata <- as.data.frame(seg)
##D rm(p, M, seg, segs, j, sigma.val)
##D #plot(data[, 1])
##D 
##D ## CE with the four parameter beta distribution with BIC as the selection criterion  ##
##D 
##D obj1 <- CE.ZINB(simdata, distyp = 1, penalty = BIC, parallel = TRUE) # Parallel computation
##D obj1
##D 
##D profilePlot(obj1, simdata) # To obtain the mean profile plot
##D 
##D ## CE with truncated normal distribution with BIC as the selection criterion  ##
##D 
##D obj2 <- CE.ZINB(simdata, distyp = 2, penalty = BIC, parallel = TRUE) # Parallel computation
##D obj2
##D 
##D profilePlot(obj2, simdata) # To obtain the mean profile plot
## End(Not run)



