library(calibrator)


### Name: cov.p5.supp
### Title: Covariance function for posterior distribution of z
### Aliases: cov.p5.supp Cov.eqn9.supp
### Keywords: array

### ** Examples

data(toys)
x <- rbind(x.toy,x.toy+1,x.toy,x.toy,x.toy)
rownames(x) <- letters[1:5]
xdash <- rbind(x*2,x.toy)
rownames(xdash) <- LETTERS[1:6]

Cov.eqn9.supp(x=x,xdash=xdash,theta=theta.toy,d=d.toy,D1=D1.toy,
    D2=D2.toy,H1=H1.toy,H2=H2.toy,phi=phi.toy)

phi.true <- phi.true.toy(phi=phi.toy)

Cov.eqn9.supp(x=x,xdash=xdash,theta=theta.toy,d=d.toy,D1=D1.toy,
     D2=D2.toy,H1=H1.toy,H2=H2.toy,phi=phi.true)


# Now try a sequence of thetas:
cov.p5.supp(x=x.toy,theta=t.vec.toy,d=d.toy,D1=D1.toy,D2=D2.toy,
    H1=H1.toy,H2=H2.toy,phi=phi.toy)




