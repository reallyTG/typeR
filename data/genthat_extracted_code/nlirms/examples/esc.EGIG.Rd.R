library(nlirms)


### Name: esc.EGIG
### Title: Expected severity of claims based on the Exponential-Generalized
###   Inverse Gaussian model
### Aliases: EGIG dEGIG esc.EGIG

### ** Examples

claim=0:5
# Expected severity of claims based on the Exponential-Generalized Inverse Gaussian model
esc.EGIG(sumsev=100 ,claim=1 , mu=50, sigma=2, nu=1)

# Expected severity of claims based on the Exponential-Inverse Gaussian model
esc.EGIG(sumsev=100 ,claim=1 , mu=50, sigma=2, nu=-.5)

# Expected severity of claims based on the Exponential-Harmonic model
esc.EGIG(sumsev=100 ,claim=claim , mu=50, sigma=2, nu=0)



