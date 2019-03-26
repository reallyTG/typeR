library(BiodiversityR)


### Name: renyiresult
### Title: Alternative Renyi Diversity Results
### Aliases: renyiresult renyiplot renyiaccumresult renyicomp
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune.env)
data(dune)
Renyi.1 <- renyiresult(dune, y=dune.env, factor='Management', level='NM', 
    method='s')
Renyi.1
renyiplot(Renyi.1, evenness=FALSE, addit=FALSE, pch=1,col='1', cex=1, 
    legend=FALSE)
## CLICK IN THE GRAPH TO INDICATE WHERE THE LEGEND NEEDS TO BE PLACED
## IN CASE THAT YOU OPT FOR LEGEND=TRUE



