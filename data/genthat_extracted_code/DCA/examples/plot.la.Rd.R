library(DCA)


### Name: plot_la
### Title: Visualizing the dynamic correlation between a pair of genes
###   given the AL scouting vector.
### Aliases: plot_la

### ** Examples

x<-la.simu.gen(n=100,p=20,n.grp=2, n.noise.gene=10, rho=0.25, pwr=1)
plot_la(x$dat[1,], x$dat[2,], x$z[,1],use.locfdr=FALSE)



