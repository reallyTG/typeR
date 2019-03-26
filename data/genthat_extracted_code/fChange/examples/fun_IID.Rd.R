library(fChange)


### Name: fun_IID
### Title: Simulate Independent Functional Data
### Aliases: fun_IID

### ** Examples

# Functional data with 21 fourier basis with a geometric eigenvalue decay
fun_IID(n=100, nbasis=21)

# Define eigenvalue decay
Sigma1=2^-(1:21)
# Then generate functional data
fun_IID(n=100, nbasis=21, Sigma=Sigma1)

# Define eigenvalue decay, and basis function
library(fda)
basis1 = create.bspline.basis(rangeval = c(0,1), nbasis=21)
Sigma1=2^-(1:21)
# Then generate functional data
fun_IID(n=100, nbasis=21, Sigma=Sigma1, basis=basis1)




