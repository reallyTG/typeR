library(vegan)


### Name: RsquareAdj
### Title: Adjusted R-square
### Aliases: RsquareAdj RsquareAdj.default RsquareAdj.rda RsquareAdj.cca
###   RsquareAdj.lm RsquareAdj.glm
### Keywords: univar multivariate

### ** Examples

data(mite)
data(mite.env)
## rda
m <- rda(decostand(mite, "hell") ~  ., mite.env)
RsquareAdj(m)
## cca
m <- cca(decostand(mite, "hell") ~  ., mite.env)
RsquareAdj(m)
## default method
RsquareAdj(0.8, 20, 5)



