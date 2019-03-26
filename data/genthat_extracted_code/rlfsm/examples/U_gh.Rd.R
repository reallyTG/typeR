library(rlfsm)


### Name: U_gh
### Title: alpha-norm of u*g + v*h.
### Aliases: U_gh

### ** Examples

g<-function(x) exp(-x^2)
h<-function(x) exp(-abs(x))
U_gh(g=g, h=h, u=4, v=3, alpha=1.7)



