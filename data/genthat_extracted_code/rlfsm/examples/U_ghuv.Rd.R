library(rlfsm)


### Name: U_ghuv
### Title: A dependence structure of 2 random variables.
### Aliases: U_ghuv

### ** Examples

g<-function(x) exp(-x^2)
h<-function(x) exp(-abs(x))
U_ghuv(alpha=1.5, sigma=1, g=g, h=h, u=10, v=15,
rel.tol = .Machine$double.eps^0.25, abs.tol=1e-11)



