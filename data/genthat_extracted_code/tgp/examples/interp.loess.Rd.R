library(tgp)


### Name: interp.loess
### Title: Lowess 2-d interpolation onto a uniform grid
### Aliases: interp.loess
### Keywords: smooth loess

### ** Examples

# random data
ed <- exp2d.rand()

# higher span = 0.5 required because the data is sparse
# and was generated randomly
ed.g <- interp.loess(ed$X[,1], ed$X[,2], ed$Z, span=0.5)

# perspective plot
persp(ed.g)



