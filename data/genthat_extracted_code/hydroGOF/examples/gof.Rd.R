library(hydroGOF)


### Name: gof
### Title: Numerical Goodness-of-fit measures
### Aliases: gof gof.default gof.matrix gof.data.frame gof.zoo
### Keywords: math

### ** Examples

sim <- 1:10
obs <- 1:10
gof(sim, obs)

sim <- 2:11
obs <- 1:10
gof(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Getting the numeric goodness of fit for the "best" (unattainable) case
gof(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Getting the new numeric goodness of fit
gof(sim=sim, obs=obs)

# Storing a matrix object with all the GoFs:
g <-  gof(sim, obs)

# Getting only the RMSE
g[4,1]
g["RMSE",]

## Not run: 
##D # Writing all the GoFs into a TXT file
##D write.table(g, "GoFs.txt", col.names=FALSE, quote=FALSE)
##D 
##D # Getting the graphical representation of 'obs' and 'sim' along with the 
##D # numeric goodness of fit 
##D ggof(sim=sim, obs=obs)
## End(Not run)




