library(palaeoSig)


### Name: species
### Title: Generates species response parameters for n dimensions
### Aliases: species
### Keywords: datagen

### ** Examples

spec.par <- species(nspp =30,, Amax = runif, srange = 200, fun = runif, xpar = c(-50,150),  
ndim =5, alpha = 4, gamma = 4)
spec.par <- species(nspp = 30,ndim = 3, Amax = runif, xpar = c(-50,150), 
srange = 200, alpha = 4, gamma = 4) 

# example where srange, alpha and gamma are different for each species and environmental gradient. 
spec.par <- species(nspp = 30,ndim = 3, Amax = runif, xpar = c(-50,150), 
srange = matrix(ncol =3, runif(90,100,200)), alpha = matrix(ncol = 3, runif(90,1,5)), 
gamma = matrix(ncol = 3, runif(90,1,5)))

# example where species optima are correlated
correlations <- list(c(1,2,0.5),c(1,3,0.3),c(2,3,0.1))
spec.cor.mat <- cor.mat.fun(3,correlations)
spec.par <- species(nspp = 30,ndim = 3, Amax = runif, xpar = c(50,50), srange = 200, 
alpha = 4, gamma = 4,ocor = spec.cor.mat, odistr = 'Gaussian')           

# example for species response curves (users should alter alpha and gamma)
spec.par <- species(nspp =1, Amax = 200, srange = 200, fun = runif, xpar = c(50,50),  
    ndim =1, alpha = 3, gamma = 1)
env <- -50:150
response <- palaeoSig:::make.abundances(env = -50:150, param = spec.par[[1]]$spp)
plot(env, response, type='l') 
                                                                                                       



