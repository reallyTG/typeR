library(MsdeParEst)


### Name: neuronal.data
### Title: Trajectories Interspike Of A Single Neuron Of A Ginea Pig
### Aliases: neuronal.data
### Keywords: data

### ** Examples

M <- 240     # number of trajectories, number of rows of the matrix of the data
T <- 0.3     # width of the interval of observation 
delta <- 0.00015   # step time
N <- T/delta  # number of points in the time interval 2000

data(neuronal.data)
# reduction of data for example to save running times
ind <- seq(1, 2000, by = 20)
X <- neuronal.data[[1]][1:50, ind]
times <- neuronal.data[[2]][ind]

# - 1) Ornstein-Uhlenbeck with two random effects in the drift and one fixed effect in the diffusion

estim<- msde.fit(times=times, X=X, model="OU")
# summary(estim)

## Not run: 
##D # - 2) Cox-Ingersoll-Ross with one random effect in the drift and one random effect in the diffusion
##D 
##D estim<- msde.fit(times=times, X=X, model="CIR", drift.random=1, diffusion.random=1)
##D # summary(estim)
##D 
##D # - 3) Cox-Ingersoll-Ross with one random effect in the drift and one fixed effect in the 
##D # diffusion  
##D 
##D estim<- msde.fit(times=times, X=X, model="CIR", drift.random=1)
##D # summary(estim)
##D 
##D # - 4) Ornstein-Uhlenbeck with a mixture distribution for the two random effects in the drift
##D # and one fixed effect in the diffusion
##D 
##D estim<- msde.fit(times=times, X=X, model="OU", nb.mixt=2)
##D summary(estim)
## End(Not run)




