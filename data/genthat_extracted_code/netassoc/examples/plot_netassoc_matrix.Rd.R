library(netassoc)


### Name: plot_netassoc_matrix
### Title: Plots matrix with colormap
### Aliases: plot_netassoc_matrix

### ** Examples

nsp <- 10
nsites <- 30
obs <- matrix(rpois(n=nsp*nsites,10),
  nrow=nsp,ncol=nsites,
  dimnames=list(paste("Species",1:nsp),paste("Site",1:nsites)))
plot_netassoc_matrix(obs, onesided=TRUE, col=heat.colors(5))

int <- matrix(rnorm(n=nsp^2),
  nrow=nsp,ncol=nsp,
  dimnames=list(paste("Species",1:nsp),paste("Species",1:nsp)))
plot_netassoc_matrix(int, onesided=FALSE, 
  col=colorRampPalette(c("red","white","blue"))(50))



