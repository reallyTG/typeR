library(GPB)


### Name: pgpb
### Title: Generalized Poisson Binomial Distribution
### Aliases: pgpb dgpb qgpb rgpb gpb.args.check

### ** Examples


pgpb(kk=0:11, pp=c(.1, .2, .3), aval=c(1,0,0), bval=c(2,3,1), wts=c(1,2,2))
dgpb(kk=0:11, pp=c(.1, .2, .3), aval=c(1,0,0), bval=c(2,3,1), wts=c(1,2,2))
qgpb(qq=c(.1,.3), pp=c(.1, .2, .3), aval=c(1,0,0), bval=c(2,3,1), wts=c(1,2,2))
rgpb(m=3, pp=c(.1, .2, .3), aval=c(1,0,0), bval=c(2,3,1), wts=c(1,2,2))

## when a, b share large common dividers, the results of following cases is the same
pgpb(kk=c(60,70,80,90), pp=c(.1, .2, .3), aval=c(10,20,30), bval=c(20,30,40), wts=c(1,1,1))
pgpb(kk=6:9, pp=c(.1, .2, .3), aval=c(1,2,3), bval=c(2,3,4), wts=c(1,1,1))

## when a, b are non-integer values, the values of kk, aval, bval can multiply powers of 10
aval=c(0.1,0.2,0.3)*10
bval=c(0.2,0.3,0.4)*10
kk=(0.6*10):(1.0*10)
pgpb(kk=kk, pp=c(.1, .2, .3), aval=aval, bval=bval, wts=c(1,1,1))




