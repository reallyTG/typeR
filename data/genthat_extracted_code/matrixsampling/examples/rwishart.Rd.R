library(matrixsampling)


### Name: rwishart
### Title: Wishart sampler
### Aliases: rwishart

### ** Examples

nu <- 4
p <- 3
Sigma <- toeplitz(p:1)
Theta <- diag(p)
Wsims <- rwishart(10000, nu, Sigma, Theta)
dim(Wsims) # 3 3 10000
apply(Wsims, 1:2, mean) # approximately nu*Sigma+Theta
# the epsilon argument:
Wsims_det <- apply(rwishart(10000, nu=p-1+0.001, Sigma), 3, det)
length(which(Wsims_det < .Machine$double.eps))
Wsims_det <- apply(rwishart(10000, nu=p-1+0.001, Sigma, epsilon=1e-8), 3, det)
length(which(Wsims_det < .Machine$double.eps))



