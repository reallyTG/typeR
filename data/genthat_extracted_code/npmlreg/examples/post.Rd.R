library(npmlreg)


### Name: post
### Title: Posterior probabilities/intercepts, and mass point
###   classifications
### Aliases: post
### Keywords: models regression

### ** Examples

 data(galaxies, package="MASS")
 gal <- as.data.frame(galaxies)
 post(alldist(galaxies/1000~1, random=~1, data=gal, k=5))$classif
    # classifies the 82 galaxies to one of the five mass points
 


