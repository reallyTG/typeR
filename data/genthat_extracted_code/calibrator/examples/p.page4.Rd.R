library(calibrator)


### Name: p.page4
### Title: A postiori probability of hyperparameters
### Aliases: p.page4
### Keywords: array

### ** Examples

data(toys)

p.page4(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=NULL, y=y.toy,
z=z.toy,E.theta=E.theta.toy, Edash.theta=Edash.theta.toy, extractor=extractor.toy, phi=phi.toy)

## Now compare the above value with p.page4() calculated with phi
## differing only in psi2:

phi.toy.new <- phi.change(phi.fun=phi.fun.toy, old.phi = phi.toy, psi2=c(8,8,8))

p.page4(D1=D1.toy, D2=D2.toy, H1=H1.toy, H2=H2.toy, V=V.toy, y=y.toy, z=z.toy,
E.theta=E.theta.toy, Edash.theta=Edash.theta.toy,
extractor=extractor.toy, phi=phi.toy.new)
## different!




