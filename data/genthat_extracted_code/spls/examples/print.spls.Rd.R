library(spls)


### Name: print.spls
### Title: Print function for a SPLS object
### Aliases: print.spls
### Keywords: regression multivariate methods

### ** Examples

data(yeast)
# SPLS with eta=0.7 & 8 hidden components
f <- spls( yeast$x, yeast$y, K=8, eta=0.7 )
print(f)



