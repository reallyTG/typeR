library(calibrator)


### Name: tt.fun
### Title: Integrals needed in KOH2001
### Aliases: tt.fun ht.fun hh.fun t.fun
### Keywords: array

### ** Examples

data(toys)

tt.fun(D1=D1.toy, extractor=extractor.toy, x.i=D2.toy[1,],
    x.j=D2.toy[2,],  phi=phi.toy)

ht.fun(x.i=D2.toy[1,], x.j=D2.toy[2,], D1=D1.toy,
    extractor=extractor.toy, 
    Edash.theta=Edash.theta.toy, H1=H1.toy, fast.but.opaque=FALSE, phi=phi.toy)

ht.fun(x.i=D2.toy[1,], x.j=D2.toy[2,], D1=D1.toy,
    extractor=extractor.toy, 
    Edash.theta=Edash.theta.toy, H1=H1.toy, fast.but.opaque=TRUE,
    x.star=extractor.toy(D1.toy)$x.star, t.vec=extractor.toy(D1.toy)$t.vec,
    phi=phi.toy)



hh.fun(x.i=D2.toy[1,], x.j=D2.toy[2,],
    H1=H1.toy, E.theta=E.theta.toy,  phi=phi.toy)

t.fun(x=x.toy, D1=D1.toy, extractor=extractor.toy, phi=phi.toy)



