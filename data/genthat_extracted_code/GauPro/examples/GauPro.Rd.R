library(GauPro)


### Name: GauPro
### Title: GauPro_selector
### Aliases: GauPro

### ** Examples

n <- 12
x <- matrix(seq(0,1,length.out = n), ncol=1)
#y <- sin(2*pi*x) + rnorm(n,0,1e-1)
y <- (2*x) %%1
gp <- GauPro(X=x, Z=y, parallel=FALSE)



