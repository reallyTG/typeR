library(UWHAM)


### Name: histw
### Title: Weighted histogram
### Aliases: histw
### Keywords: free energy

### ** Examples

# Boltzmann constant
bet <- 1.0/(0.001986209*300.0)

# negative potential function 
npot.fcn <- function(x, lam)
   -bet*lam*x

# read data (soft.core)
lam <- c(0.0, 0.001, 0.002, 0.004, 0.006, 0.008, 0.01, 0.02, 0.06, 0.1,
         0.25, 0.5, 0.75, 0.9, 1.0)
m <- length(lam)

data(ligand2.soft)
lig.data <- ligand2.soft$V1

size <- rep(1000, m)
N <- sum(size)

# compute negative potential
neg.pot <- matrix(0, N,m)

for (j in 1:length(lam))
  neg.pot[,j] <- npot.fcn(x=lig.data, lam=lam[j])

# estimate free energies 
out <- uwham(logQ=neg.pot, size=size, fisher=TRUE)

-out$ze/bet + 0.71

sqrt(out$ve)/bet

# the bins used to construct weighted histograms 
bins <- seq(-35, 400, 2.5)
grid <- c(bins, 2e+3)

W <- out$W /N

par(mfrow=c(1,2))

# Plot the weighted histograms at two lambdas
histw(lig.data, w=W[,8], xaxis=grid, xmin=-35, xmax=200, ymax=.1)

histw(lig.data, w=W[,10], xaxis=grid, xmin=-35, xmax=200, ymax=.1, 
      bar=0, add=TRUE, col="red")

# plot the raw histogram and weighted histogram
histw(lig.data[ (5*1000+1):(6*1000) ], w=rep(1,1000), 
      xaxis=grid, xmin=-35, xmax=200, ymax=.04)

histw(lig.data, w=W[,6], xaxis=grid, xmin=-35, xmax=200, ymax=.04, 
      bar=0, add=TRUE, col="red")



