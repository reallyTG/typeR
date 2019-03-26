library(BiodiversityR)


### Name: rankabundance
### Title: Rank Abundance Curves
### Aliases: rankabundance rankabunplot rankabuncomp
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune.env)
data(dune)
RankAbun.1 <- rankabundance(dune)
RankAbun.1
rankabunplot(RankAbun.1, scale='abundance', addit=FALSE, specnames=c(1,2,3))
rankabunplot(RankAbun.1, scale='logabun', addit=FALSE, specnames=c(1:30), 
    srt=45, ylim=c(1,100))
rankabuncomp(dune, y=dune.env, factor='Management', 
    scale='proportion', legend=FALSE)
## CLICK IN THE GRAPH TO INDICATE WHERE THE LEGEND NEEDS TO BE PLACED
## IF YOU OPT FOR LEGEND=TRUE.



