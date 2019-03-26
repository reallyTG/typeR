library(BiodiversityR)


### Name: accumresult
### Title: Alternative Species Accumulation Curve Results
### Aliases: accumresult accumplot accumcomp
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune.env)
data(dune)
dune.env$site.totals <- apply(dune,1,sum)
Accum.1 <- accumresult(dune, y=dune.env, scale='site.totals', method='exact', conditioned=TRUE)
Accum.1
accumplot(Accum.1)
accumcomp(dune, y=dune.env, factor='Management', method='exact', legend=FALSE, conditioned=TRUE)
## CLICK IN THE GRAPH TO INDICATE WHERE THE LEGEND NEEDS TO BE PLACED FOR
## OPTION WHERE LEGEND=TRUE (DEFAULT).



