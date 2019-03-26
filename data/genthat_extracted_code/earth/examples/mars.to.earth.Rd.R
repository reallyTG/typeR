library(earth)


### Name: mars.to.earth
### Title: Convert a mars object from the mda package to an earth object
### Aliases: mars.to.earth
### Keywords: models

### ** Examples

if(require(mda)) {
    mars.mod <- mars(trees[,-3], trees[,3])
    earth.mod <- mars.to.earth(mars.mod)
    # the standard earth functions can now be used
    # note the reconstructed call in the summary
    summary(earth.mod, digits = 2)
}



