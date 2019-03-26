library(fdaPDE)


### Name: smooth.FEM.PDE.basis
### Title: Spatial regression with differential regularization: anysotropic
###   case (elliptic PDE)
### Aliases: smooth.FEM.PDE.basis

### ** Examples

# Load the mesh and plot it
data(mesh.2D.simple)
plot(mesh.2D.simple)
# Create a vector of noisy samples of an underlying spatial field, 
# located over the nodes of the mesh
observations = sin(pi*mesh.2D.simple$nodes[,1]) + rnorm(n = nrow(mesh.2D.simple$nodes), sd = 0.1)
# Create the FEM basis object
FEMbasis = create.FEM.basis(mesh.2D.simple)

# Set a vector of smoothing coefficients
lambda = c(10^-4, 1, 10^4)

# Set the anysotropic smoothing matrix K
PDE_parameters_anys = list(K = matrix(c(0.01,0,0,1), nrow = 2), b = c(0,0), c = 0)
# Estimate one field for each smoothing parameter and plot these
FEM_CPP_PDE = smooth.FEM.PDE.basis(observations = observations, 
                                   FEMbasis = FEMbasis, lambda = lambda, 
                                   PDE_parameters = PDE_parameters_anys)
plot(FEM_CPP_PDE$fit.FEM)

# Evaluate solution in three points
eval.FEM(FEM_CPP_PDE$fit.FEM, locations = rbind(c(0,0),c(0.5,0),c(-2,-2)))



