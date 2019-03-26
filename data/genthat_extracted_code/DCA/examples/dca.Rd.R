library(DCA)


### Name: dca
### Title: Dynamic Correlation Analysis
### Aliases: dca

### ** Examples

x<-la.simu.gen(n=100,p=200,n.grp=2, n.noise.gene=100, rho=0.5, pwr=0.5)
z<-dca(x$dat, n.fac=2)
cor(z[[2]], x$z, method="spearman")



