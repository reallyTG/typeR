library(matrixsampling)


### Name: rinvwishart
### Title: Inverse-Wishart sampler
### Aliases: rinvwishart

### ** Examples

nu <- 6
p <- 3
Omega <- toeplitz(p:1)
IWsims <- rinvwishart(10000, nu, Omega)
dim(IWsims) # 3 3 10000
apply(IWsims, 1:2, mean) # approximately Omega/(nu-p-1)
# the epsilon argument:
IWsims <- tryCatch(rinvwishart(10000, nu=p+0.001, Omega),
                   error=function(e) e)
IWsims <- tryCatch(rinvwishart(10000, nu=p+0.001, Omega, epsilon=1e-8),
                   error=function(e) e)



