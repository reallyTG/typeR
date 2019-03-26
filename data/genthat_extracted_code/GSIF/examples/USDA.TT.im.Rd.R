library(GSIF)


### Name: USDA.TT.im
### Title: Probability density for texture triangle
### Aliases: USDA.TT.im TT2tri
### Keywords: datasets

### ** Examples

## plot prior probabilities:
library(sp)
data(USDA.TT.im)
gridded(USDA.TT.im) <- ~s1+s2
spplot(USDA.TT.im["v"])

## Not run: 
##D library(soiltexture)
##D ## convert textures by hand to sand, silt and clay:
##D TEXMHT <- c("CL","C","SiL","SiL","missing")
##D x <- TT2tri(TEXMHT)
##D x
## End(Not run)



