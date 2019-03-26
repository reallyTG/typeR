library(fChange)


### Name: fun_MA
### Title: Simulate Functional Moving Average Process
### Aliases: fun_MA

### ** Examples

# FMA(1) data with 21 fourier basis with a geometric eigenvalue decay
fun_MA(n=100, nbasis=21, order=1, kappa=0.8)


# Define eigenvalue decay
Sigma1 = 2^-(1:21)
# Then generate FMA(2) data
fun_MA(n=100, nbasis=21, order=2, kappa= c(0.5, 0.3), Sigma=Sigma1)

# Define eigenvalue decay, and basis function
library(fda)
basis1 = create.bspline.basis(rangeval = c(0,1), nbasis=21)
Sigma1 = 2^-(1:21)
# Then generate FMA(1)
fun_MA(n=100, nbasis=21, order=1, kappa= 0.3,Sigma=Sigma1, basis=basis1)

# Not defining order will result in generating IID functions
fun_MA(n=100, nbasis=21) # same as fun_IID(n=100, nbasis=21)



