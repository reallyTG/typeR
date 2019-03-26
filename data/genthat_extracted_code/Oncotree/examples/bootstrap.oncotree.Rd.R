library(Oncotree)


### Name: bootstrap
### Title: Bootstrap an oncogenetic tree to assess stability
### Aliases: bootstrap.oncotree print.boottree plot.boottree
### Keywords: models nonparametric

### ** Examples

   data(ov.cgh)
   ov.tree <- oncotree.fit(ov.cgh)
   set.seed(43636)
   ov.b1 <- bootstrap.oncotree(ov.tree, R=100, type="parametric")
   ov.b1
   opar <- par(mfrow=c(3,2), mar=c(2,0,0,0))
   plot(ov.b1, nboots=4)
   plot(ov.b1, nboots=4, fix.nodes=TRUE)
   par(opar)



