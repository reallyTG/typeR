library(GauPro)


### Name: GauPro_kernel_model
### Title: GauPro model that uses kernels
### Aliases: GauPro_kernel_model
### Keywords: Gaussian data, kriging, process, regression

### ** Examples

n <- 12
x <- matrix(seq(0,1,length.out = n), ncol=1)
y <- sin(2*pi*x) + rnorm(n,0,1e-1)
gp <- GauPro_kernel_model$new(X=x, Z=y, kernel=Gaussian$new(1), parallel=FALSE)
gp$predict(.454)



