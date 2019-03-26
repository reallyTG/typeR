library(calibrator)


### Name: tee
### Title: Auxiliary functions for equation 9 of the supplement
### Aliases: tee h.fun
### Keywords: array

### ** Examples

data(toys)
tee(x=x.toy, theta=theta.toy, D1=D1.toy, D2=D2.toy, phi=phi.toy)


# Now some vectorized examples:
jj <- rbind(x.toy , x.toy , x.toy+0.01,x.toy+1,x.toy*10)

tee(x=jj, theta=theta.toy, D1=D1.toy, D2=D2.toy, phi=phi.toy)
h.fun(x=jj, theta=theta.toy, H1=H1.toy, H2=H2.toy, phi=phi.toy)




