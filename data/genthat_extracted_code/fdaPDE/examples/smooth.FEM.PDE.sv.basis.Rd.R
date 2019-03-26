library(fdaPDE)


### Name: smooth.FEM.PDE.sv.basis
### Title: Spatial regression with differential regularization: anysotropic
###   and non-stationary case (elliptic PDE with space-varying
###   coefficients)
### Aliases: smooth.FEM.PDE.sv.basis

### ** Examples

# Loading the mesh
data(mesh.2D.rectangular)
# Create the FEM basis object
FEMbasis = create.FEM.basis(mesh.2D.rectangular)
# Create a vector of noisy samples of an underlying spatial field, 
# located over the nodes of the mesh
observations = sin(0.2*pi*mesh.2D.rectangular$nodes[,1]) + 
rnorm(n = nrow(mesh.2D.rectangular$nodes), sd = 0.1)
# Set the smoothing coefficient
lambda = c(10^-2)
#Set the space vriant coefficients of the penalizying PDE
K_func<-function(points)
{
mat<-c(0.01,0,0,1)
output = array(0, c(2, 2, nrow(points)))
for (i in 1:nrow(points))
   output[,,i] = 0.5*mat %*% t(points[i,1]^2)
output
}
b_func<-function(points)
{
output = array(0, c(2, nrow(points)))
for (i in 1:nrow(points))
   output[,i] = 0
output
}

c_func<-function(points)
{
rep(c(0), nrow(points))
}

u_func<-function(points)
{
rep(c(0), nrow(points))
}
# Assemble the parameters in one object
PDE_parameters = list(K = K_func, b = b_func, c = c_func, u = u_func)
# Estimate the underlying spatial field and plot these
FEM_CPP_PDE = smooth.FEM.PDE.sv.basis(observations = observations, 
             FEMbasis = FEMbasis, lambda = lambda, PDE_parameters = PDE_parameters)
plot(FEM_CPP_PDE$fit.FEM)



