library(simstudy)


### Name: genCorGen
### Title: Create multivariate (correlated) data - for general
###   distributions
### Aliases: genCorGen

### ** Examples

set.seed(23432)
l <- c(8, 10, 12)

genCorGen(1000, nvars = 3, params1 = l, dist = "poisson", rho = .7, corstr = "cs")
genCorGen(1000, nvars = 3, params1 = 5, dist = "poisson", rho = .7, corstr = "cs")
genCorGen(1000, nvars = 3, params1 = l, dist = "poisson", rho = .7, corstr = "cs", wide = TRUE)
genCorGen(1000, nvars = 3, params1 = 5, dist = "poisson", rho = .7, corstr = "cs", wide = TRUE)

genCorGen(1000, nvars = 3, params1 = l, dist = "poisson", rho = .7, corstr = "cs",
          cnames = "new_var")
genCorGen(1000, nvars = 3, params1 = l, dist = "poisson", rho = .7, corstr = "cs",
          wide = TRUE, cnames = "a, b, c")

genCorGen(1000, nvars = 3, params1 = c(.3, .5, .7), dist = "binary", rho = .3, corstr = "cs")
genCorGen(1000, nvars = 3, params1 = l, params2 = c(1,1,1), dist = "gamma", rho = .3,
          corstr = "cs", wide = TRUE)
          
genCorGen(1000, nvars = 3, params1 = c(.3, .5, .7), dist = "binary", 
          corMatrix = genCorMat(3), method = "ep")
genCorGen(1000, nvars = 3, params1 = c(.3, .5, .7), dist = "binary", 
          corMatrix = genCorMat(3), method = "copula")




