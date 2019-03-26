library(gstat)


### Name: variogramSurface
### Title: Semivariance values for a given spatio-temporal variogram model
### Aliases: variogramSurface
### Keywords: models spatio-temporal

### ** Examples

separableModel <- vgmST("separable", 
                        space=vgm(0.86, "Exp", 476, 0.14),
                        time =vgm(   1, "Exp",   3, 0),
                        sill=113)

data(vv)

if(require(lattice)) {
plot(vv, separableModel, wireframe=TRUE, all=TRUE)
}

# plotting of sample and model variogram
plot(vv, separableModel)




