library(StempCens)


### Name: CovarianceM
### Title: Covariance matrix for spatio-temporal model
### Aliases: CovarianceM

### ** Examples

# Initial parameter values
beta <- c(-1,1.50); phi <- 5; rho <- 0.45; tau2 <- 0.80; sigma2 <- 2
# Simulating data
n1 <- 10   # Number of spatial locations
n2 <- 5    # Number of temporal index
set.seed(1000)
x.coord <- round(runif(n1,0,10),9)    # X coordinate
y.coord <- round(runif(n1,0,10),9)    # Y coordinate
coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
time <- as.matrix(seq(1,n2,1))        # Time index without repetitions
# Covariance matrix
H <- as.matrix(dist(coordenadas)) # Spatial distances
Mt <- as.matrix(dist(time))       # Temporal distances
Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="exponential")



