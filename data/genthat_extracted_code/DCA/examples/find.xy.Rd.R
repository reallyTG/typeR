library(DCA)


### Name: find.xy
### Title: Find variable pairs for a given set of LA scouting vectors.
### Aliases: find.xy

### ** Examples

x<-la.simu.gen(n=100,p=80,n.grp=2, n.noise.gene=100, rho=0.5, pwr=0.25)
z<-dca(x$dat, n.fac=2)
xy<-find.xy(x$dat, z[[2]], fdr.cut=0.01)
summary(xy)
xy[[1]][1:5,]
xy[[2]][1:5,]



