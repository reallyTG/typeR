library(dmt)


### Name: fit.dependency.model
### Title: Fit dependency model between two data sets.
### Aliases: fit.dependency.model ppca pcca pfa
### Keywords: math

### ** Examples

data(modelData) # Load example data X, Y

# probabilistic CCA
model <- pcca(X, Y)

# dependency model with priors (W>=0; Wx = Wy; full marginal covariances)
model <- fit.dependency.model(X, Y, zDimension = 1, 
      	 		      priors = list(W = 1e-3, Nm.wx.wy.sigma = 0), 
			      marginalCovariances = "full")

# Getting the latent variable Z when it has been calculated with the model
#getZ(model)




