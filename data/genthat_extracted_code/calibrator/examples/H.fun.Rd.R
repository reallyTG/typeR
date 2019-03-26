library(calibrator)


### Name: H.fun
### Title: H function
### Aliases: H.fun
### Keywords: array

### ** Examples

data(toys)
H.fun(theta=theta.toy, D1=D1.toy, D2=D2.toy, H1=H1.toy,
       H2=H2.toy, phi=phi.toy)

H.fun(theta=theta.toy, D1=D1.toy[1,,drop=FALSE], D2=D2.toy,
       H1=H1.toy, H2=H2.toy, phi=phi.toy)

H.fun(theta=theta.toy, D1=D1.toy[1,,drop=FALSE],
       D2=D2.toy[1,,drop=FALSE],
       H1=H1.toy, H2=H2.toy, phi=phi.toy)



