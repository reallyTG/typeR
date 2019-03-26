library(MFPCA)


### Name: umpcaBasis
### Title: Calculate an uncorrelated multilinear principal component basis
###   representation for functional data on two-dimensional domains
### Aliases: umpcaBasis
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

# calculate basis functions based on UMPCA algorithm (needs some time)
## No test: 
# throws warning as the function aims more at  uncorrelated features than at
# optimal data reconstruction (see help)
umpca <- MFPCA:::umpcaBasis(f, npc = 5) 

oldpar <- par(no.readonly = TRUE)

for(i in 1:5) # plot all 5 basis functions
plot(umpca$functions, obs = i, main = paste("Basis function", i)) # plot first basis function

par(oldpar)
## End(No test)



