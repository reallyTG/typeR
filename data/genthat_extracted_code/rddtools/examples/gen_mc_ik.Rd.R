library(rddtools)


### Name: gen_mc_ik
### Title: Generate Monte Carlo simulations of Imbens and Kalyanaraman
### Aliases: gen_mc_ik

### ** Examples

mc1_dat <- gen_mc_ik()
MC1_rdd <- rdd_data(y=mc1_dat$y, x=mc1_dat$x, cutpoint=0)

## Use np regression:
reg_nonpara <- rdd_reg_np(rdd_object=MC1_rdd)
reg_nonpara

# Represent the curves:
plotCu <- function(version=1, xlim=c(-0.1,0.1)){
  res <- gen_mc_ik(sd=0.0000001, n=1000, version=version)
  res <- res[order(res$x),]
  ylim <- range(subset(res, x>=min(xlim) & x<=max(xlim), 'y'))
  plot(res, type='l', xlim=xlim, ylim=ylim, main=paste('DGP', version))
  abline(v=0)
  xCut <- res[which(res$x==min(res$x[res$x>=0]))+c(0,-1),]
  points(xCut, col=2)
}
layout(matrix(1:4,2, byrow=TRUE))
plotCu(version=1)
plotCu(version=2)
plotCu(version=3)
plotCu(version=4)
layout(matrix(1))



