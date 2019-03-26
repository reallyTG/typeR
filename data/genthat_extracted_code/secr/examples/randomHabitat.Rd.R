library(secr)


### Name: randomHabitat
### Title: Random Landscape
### Aliases: randomHabitat
### Keywords: datagen

### ** Examples


## Not run: 
##D 
##D tempmask <- make.mask(nx = 100, ny = 100, spacing = 20)
##D mrcmask <- randomHabitat(tempmask, p = 0.4, A = 0.4)
##D plot(mrcmask, dots = FALSE, col = "green")
##D pop <- sim.popn(10, mrcmask, model2D = "IHP")
##D plot(pop, add = TRUE)
##D 
##D ## plot intermediate steps A, C, D
##D par(mfrow = c(1,3))
##D mrcmask <- randomHabitat(tempmask, p = 0.4, A = 0.4, plt = TRUE)
##D par(mfrow = c(1,1))    ## reset to default
##D 
##D ## keep non-habitat cells
##D mrcmask <- randomHabitat(tempmask, p = 0.4, A = 0.4, drop = FALSE)
##D plot(mrcmask, covariate = "habitat", dots = FALSE,
##D     col = c("grey","green"), breaks = 2)
##D 
##D ## effect of purging small patches
##D opar <- par(mfrow=c(1,2))
##D mrcmask <- randomHabitat(tempmask, p = 0.4, A = 0.4, minpatch = 1)
##D plot(mrcmask, dots = FALSE, col  ="green")
##D mrcmask <- randomHabitat(tempmask, p = 0.4, A = 0.4, minpatch = 5)
##D plot(mrcmask, dots = FALSE, col  ="green")
##D par(opar)
## End(Not run)




