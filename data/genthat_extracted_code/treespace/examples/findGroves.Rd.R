library(treespace)


### Name: findGroves
### Title: Identify clusters of similar trees
### Aliases: findGroves

### ** Examples


if(require("adegenet") && require("adegraphics")){
## load data
data(woodmiceTrees)

## run findGroves: treespace+clustering
res <- findGroves(woodmiceTrees, nf=5, nclust=6)

## plot results on first 2 axes
PCs <- res$treespace$pco$li
s.class(PCs, fac=res$groups, col=funky(6))

## using plotGroves
plotGroves(res)
}





