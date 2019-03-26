library(fdaPDE)


### Name: smooth.FEM.basis
### Title: Spatial regression with differential regularization: stationary
###   and isotropic case (Laplacian)
### Aliases: smooth.FEM.basis

### ** Examples

library(fdaPDE)
## Load the Meuse data and a domain boundary for these data
data(MeuseData)
data(MeuseBorder)
## Create a triangular mesh for these data with the provided boundary and plot it
order=1
mesh <- create.MESH.2D(nodes = MeuseData[,c(2,3)], segments = MeuseBorder, order = order)
plot(mesh)
## Create the Finite Element basis 
FEMbasis = create.FEM.basis(mesh)
## Estimate zync field without using covariates, setting the smoothing parameter to 10^3.5
data = log(MeuseData[,"zinc"])
lambda = 10^3.5
ZincMeuse = smooth.FEM.basis(observations = data, 
                             FEMbasis = FEMbasis, lambda = lambda)
## Plot the estimated spatial field 
plot(ZincMeuse$fit.FEM)
# Now repeat the analysis using as covariates the square root of the log-distance 
# from river \code{sqrt(dist.log(m))} and the altitude \code{elev}
desmat = matrix(1,nrow=nrow(MeuseData),ncol=2)
desmat[,1] = sqrt(MeuseData[,"dist.log(m)"])
desmat[,2] = MeuseData[,"elev"]
ZincMeuseCovar = smooth.FEM.basis(observations = data, covariates = desmat, 
                                   FEMbasis = FEMbasis, lambda = lambda)
# Plot of the non parametric part (f) of the regression model y_i = beta_1 x_i1 + beta_2 x_i2 + f
plot(ZincMeuseCovar$fit.FEM)
# Print covariates' regression coefficients
print(ZincMeuseCovar$beta)



