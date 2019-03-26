library(treespace)


### Name: plotGrovesD3
### Title: Scatterplot of groups of trees using 'scatterD3'
### Aliases: plotGrovesD3

### ** Examples


## Not run: 
##D if(require("adegenet") && require("scatterD3")){
##D ## load data
##D data(woodmiceTrees)
##D 
##D ## run findGroves: treespace+clustering
##D res <- findGroves(woodmiceTrees, nf=5, nclust=6)
##D 
##D ## basic plot
##D plotGrovesD3(res)
##D 
##D ## adding tree labels
##D plotGrovesD3(res, treeNames=1:201)
##D 
##D ## customizing: vary the colour and the symbol by group
##D plotGrovesD3(res, symbol_var=res$groups)
##D 
##D ## example with no group information
##D plotGrovesD3(res$treespace$pco)
##D }
## End(Not run)




