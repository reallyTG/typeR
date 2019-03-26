library(MFPCA)


### Name: fcptpaBasis
### Title: Calculate a smooth PCA representation for functional data on
###   two-dimensional domains
### Aliases: fcptpaBasis
### Keywords: internal

### ** Examples

# simulate image data for N = 100 observations
N <- 100
b1 <- eFun(seq(0,1,0.01), M = 7, type = "Poly")
b2 <- eFun(seq(-pi, pi, 0.03), M = 8, type = "Fourier")
b <- tensorProduct(b1,b2) # 2D basis functions
scores <- matrix(rnorm(N*56), nrow = N)

# calculate observations (= linear combination of basis functions)
f <- MFPCA:::expandBasisFunction(scores = scores, functions = b)

# calculate basis functions based on FCP_TPA algorithm (needs some time)
## No test: 
fcptpa <- MFPCA:::fcptpaBasis(f, npc = 5, alphaRange = list(v = c(1e-5, 1e5), w = c(1e-5, 1e5)))

oldpar <- par(no.readonly = TRUE)

for(i in 1:5) # plot all 5 basis functions
plot(fcptpa$functions, obs = i, main = paste("Basis function", i)) # plot first basis function

par(oldpar)
## End(No test)



