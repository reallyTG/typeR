library(BayesBD)


### Name: plotBD
### Title: Visualization of posterior boundary estimates and data
### Aliases: plotBD

### ** Examples

## Not run: 
##D set.seed(12345)
##D gamma.fun = ellipse(a = 0.35, b = 0.25)
##D bin.obs = par2obs(m = 100, pi.in = 0.5, pi.out = 0.2,
##D  design = 'J', center = c(0.5,0.5), gamma.fun)
##D bin.fit = fitBinImage(image = bin.obs, nrun=1000, nburn=1000,
##D  J=10, ordering='I', slice = FALSE, outputAll=FALSE)
##D par(mfrow = c(1,3))
##D plotBD(bin.fit, 1)
##D plotBD(bin.fit, 2)
##D plotBD(bin.fit, 3)
## End(Not run)



