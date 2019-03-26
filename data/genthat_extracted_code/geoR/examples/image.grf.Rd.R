library(geoR)


### Name: image.grf
### Title: Image, Contour or Perspective Plot of Simulated Gaussian Random
###   Field
### Aliases: image.grf contour.grf persp.grf .geoR_fullGrid
### Keywords: spatial dplot

### ** Examples

# generating 4 simulations of a Gaussian random field
sim <- grf(441, grid="reg", cov.pars=c(1, .25), nsim=4)
op <- par(no.readonly = TRUE)
par(mfrow=c(2,2), mar=c(3,3,1,1), mgp = c(2,1,0))
for (i in 1:4)
  image(sim, sim.n=i)
par(op)



