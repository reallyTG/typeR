library(breakpoint)


### Name: CE.NB
### Title: Multiple Break-point Detection via the CE Method with Negative
###   Binomial Distribution
### Aliases: CE.NB

### ** Examples

#### Simulated data example ###
segs <- 6 # Number of segements
M <- c(1500, 2200, 800, 2500, 1000, 2000) # Segment width
#true.locations <- c(1501, 3701, 4501, 7001, 8001)  # True break-point locations 
seg <- NULL 
p <- c(0.45, 0.25, 0.4, 0.2, 0.3, 0.6) # Specification of p's for each segment
for(j in 1:segs){
  seg <- c(seg, rnbinom(M[j], size =10, prob = p[j]))
}
simdata <- as.data.frame(seg)
rm(p, M, seg, segs, j)
#plot(data[, 1])

## Not run: 
##D ## CE with the four parameter beta distribution with BIC as the selection criterion ##
##D 
##D obj1 <- CE.NB(simdata, distyp = 1, penalty = BIC, parallel = TRUE) # Parallel computation
##D obj1
##D 
##D profilePlot(obj1, simdata) # To obtain the mean profile plot
##D 
##D ## CE with truncated normal distribution with BIC as the selection criterion ##
##D 
##D obj2 <- CE.NB(simdata, distyp = 2, penalty = BIC, parallel = TRUE) # Parallel computation
##D obj2
##D 
##D profilePlot(obj1, simdata) # To obtain the mean profile plot
## End(Not run)



