library(calibrator)


### Name: Ez.eqn7.supp
### Title: Expectation of z given y, beta2, phi
### Aliases: Ez.eqn7.supp
### Keywords: array

### ** Examples

data(toys)
etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
    E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)
beta2 <- beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=V.toy, z=z.toy,
etahat.d2=etahat.d2, extractor=extractor.toy, E.theta=E.theta.toy,
Edash.theta=Edash.theta.toy, phi=phi.toy)
Ez.eqn7.supp(z=z.toy, 
    D1=D1.toy, H1=H1.toy, D2=D2.toy, H2=H2.toy, 
    extractor=extractor.toy, beta2=beta2, y=y.toy, 
    E.theta=E.theta.toy, 
    phi=phi.toy)



