library(fChange)


### Name: fun_AR
### Title: Simulate Functional Auto-Regressive Process
### Aliases: fun_AR

### ** Examples

# FAR(1) data with 21 fourier basis with a geometric eigenvalue decay
fun_AR(n=100, nbasis=21, order=1, kappa=0.8)


# Define eigenvalue decay
Sigma1 = 2^-(1:21)
# Then generate FAR(2) data
fun_AR(n=100, nbasis=21, order=2, kappa= c(0.5, 0.3), Sigma=Sigma1)

# Define eigenvalue decay, and basis function
library(fda)
basis1 = create.bspline.basis(rangeval = c(0,1), nbasis=21)
Sigma1 = 2^-(1:21)
# Then generate FAR(1)
fun_AR(n=100, nbasis=21, order=1, kappa= 0.3,Sigma=Sigma1, basis=basis1)

# Not defining order will result in generating IID functions
fun_AR(n=100, nbasis=21) # same as fun_IID(n=100, nbasis=21)



