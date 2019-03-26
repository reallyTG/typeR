library(GauPro)


### Name: GauPro_Gauss
### Title: Corr Gauss GP using inherited optim
### Aliases: GauPro_Gauss
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

n <- 12
x <- matrix(seq(0,1,length.out = n), ncol=1)
y <- sin(2*pi*x) + rnorm(n,0,1e-1)
gp <- GauPro(X=x, Z=y, parallel=FALSE)



