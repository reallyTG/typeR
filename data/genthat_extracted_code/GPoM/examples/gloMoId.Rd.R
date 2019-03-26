library(GPoM)


### Name: gloMoId
### Title: Global Model Identification
### Aliases: gloMoId

### ** Examples


#############
# Example 1 #
#############
# load data
data("Ross76")
tin <- Ross76[,1]
data <- Ross76[,2:3]

# Polynomial identification
reg <- gloMoId(data[0:500,2], dt=1/100, nVar=2, dMax=2, show=0)

#############
# Example 2 #
#############
# load data
data(NDVI)

# Definition of the Model structure
terms <- c(1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1)
poLabs(3,3,terms==1)
reg <- gloMoId(NDVI [,1:1], dt=1/125, nVar=3, dMax=3,
               show=0, filterReg=terms==1)


## Not run: 
##D #############
##D # Example 3 #
##D #############
##D # load data
##D data("Ross76")
##D # time vector
##D tin <- Ross76[1:500,1]
##D # single time series
##D series <- Ross76[1:500,3]
##D # some noise is added
##D series[1:100] <- series[1:100] + 0.01 * runif(1:100, min = -1, max = 1)
##D series[301:320] <- series[301:320] + 0.05 * runif(1:20, min = -1, max = 1)
##D # weighting function
##D W <- tin * 0 + 1
##D W[1:100] <- 0  # the first hundred values will not be considered
##D W[301:320] <- 0  # twenty other values will not be considered either
##D reg <- gloMoId(series, dt=1/100, weight = W, nVar=3, dMax=2, show=1)
##D visuEq(3, 2, reg$K, approx = 4)
##D # first weight which value not equal to zero:
##D i1 = which(reg$finalWeight == 1)[1]
##D v0 <-  reg$init[i1,1:3]
##D 
##D reconstr <- numicano(nVar=3, dMax=2, Istep=5000, onestep=1/250, PolyTerms=reg$K,
##D                      v0=v0, method="ode45")
##D plot(reconstr$reconstr[,2], reconstr$reconstr[,3], type='l', lwd = 3,
##D                             main='phase portrait', xlab='time t', ylab = 'x(t)', col='orange')
##D # original data:
##D lines(reg$init[,1], reg$init[,2], type='l',
##D       main='phase portrait', xlab='x', ylab = 'dx/dt', col='black')
##D # initial condition
##D lines(v0[1], v0[2], type = 'p', col = 'red')
##D 
## End(Not run)



