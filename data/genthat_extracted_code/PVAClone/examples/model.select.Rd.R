library(PVAClone)


### Name: model.select
### Title: Model selection for 'pva' objects
### Aliases: model.select pva.llr print.pvaModelSelect
### Keywords: htest models ts

### ** Examples

## Not run: 
##D data(redstart)
##D m1 <- pva(redstart, gompertz("none"), 2, n.iter=1000)
##D m2 <- pva(redstart, gompertz("poisson"), 2, n.iter=1000)
##D m3 <- pva(redstart, gompertz("normal"), 2, n.iter=1000)
##D p <- generateLatent(m2, n.chains=1, n.iter=10000)
##D pva.llr(m1, m2, p)
##D model.select(m1, m2)
##D model.select(m1, m3)
##D model.select(m2, m3)
##D 
##D m1x <- pva(redstart, ricker("none"), 2, n.iter=1000)
##D m2x <- pva(redstart, ricker("poisson"), 2, n.iter=1000)
##D m3x <- pva(redstart, ricker("normal"), 2, n.iter=1000)
##D 
##D model.select(m1, m1x)
##D model.select(m2, m2x)
##D model.select(m3, m3x)
##D 
##D ## missing data situation
##D data(paurelia)
##D m1z <- pva(paurelia, ricker("none"), 2, n.iter=1000)
##D m2z <- pva(paurelia, ricker("poisson"), 2, n.iter=1000)
##D m3z <- pva(paurelia, ricker("normal"), 2, n.iter=1000)
##D 
##D #model.select(m1z, m2z) # not yet implemented
##D #model.select(m1z, m3z) # not yet implemented
##D model.select(m2z, m3z)
##D 
##D ## Analysis of song sparrow data in Nadeem and Lele (2012)
##D ## use about 100 clones to get MLE's repoted in the paper.
##D data(songsparrow)
##D m1z <- pva(songsparrow, 
##D     thetalogistic_D("normal",fixed=c(sigma2.d=0.66)), 
##D     n.clones=5, n.adapt=3000, n.iter=1000)
##D m2z <- pva(songsparrow, 
##D     thetalogistic_D("normal",fixed=c(theta=1, sigma2.d=0.66)), 
##D     n.clones=5, n.adapt=3000,n.iter=1000)
##D m3z <- pva(songsparrow, 
##D     thetalogistic_D("none",fixed=c(sigma2.d=0.66)), 
##D     n.clones=5, n.adapt=3000,n.iter=1000)
##D m4z <- pva(songsparrow, 
##D     thetalogistic_D("none",fixed=c(theta=1,sigma2.d=0.66)), 
##D     n.clones=5, n.adapt=3000,n.iter=1000)
##D 
##D model.select(m2z, m1z) 
##D model.select(m3z, m1z) 
##D model.select(m4z, m1z)
##D 
##D ## profile likelihood
##D m <- pva(redstart, gompertz("normal"), 5, n.iter=5000)
##D p <- generateLatent(m, n.chains=1, n.iter=10000)
##D m1 <- pva(redstart, gompertz("normal", 
##D     fixed=c(sigma=0.4)), 5, n.iter=5000)
##D ## etc for many sigma values
##D pva.llr(m1, m, p) # calculate log LR for each
##D ## finally, fit smoother to points and plot
## End(Not run)



