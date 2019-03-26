library(calibrator)


### Name: beta2hat.fun
### Title: estimator for beta2
### Aliases: beta2hat.fun
### Keywords: array

### ** Examples

data(toys)

etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL,
z=z.toy, etahat.d2=etahat.d2, extractor=extractor.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy, phi=phi.toy)

jj <- create.new.toy.datasets(D1.toy , D2.toy)
phi.true <- phi.true.toy(phi=phi.toy)
y.toy <- jj$y.toy
z.toy <- jj$z.toy
d.toy <- jj$d.toy

etahat.d2 <- etahat(D1=D1.toy, D2=D2.toy, H1=H1.toy, y=y.toy,
E.theta=E.theta.toy, extractor=extractor.toy, phi=phi.toy)

beta2hat <- beta2hat.fun(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL,
z=z.toy, etahat.d2=etahat.d2, extractor=extractor.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
phi=phi.toy)

print(beta2hat)

plot(z.toy , H2.toy(D2.toy) %*% beta2hat) 





