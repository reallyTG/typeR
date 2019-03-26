library(treespace)


### Name: plotGroves
### Title: Scatterplot of groups of trees
### Aliases: plotGroves

### ** Examples


## Not run: 
##D if(require("adegenet") && require("adegraphics")){
##D ## load data
##D data(woodmiceTrees)
##D 
##D ## run findGroves: treespace+clustering
##D res <- findGroves(woodmiceTrees, nf=5, nclust=6)
##D 
##D ## basic plot
##D plotGroves(res)
##D 
##D ## adding labels
##D plotGroves(res, lab.show=TRUE)
##D 
##D ## customizing
##D plotGroves(res, lab.show=TRUE,
##D bg="black", lab.col="white", scree.size=.35)
##D 
##D ## customizing
##D plotGroves(res, type="ellipse", lab.show=TRUE,
##D lab.optim=FALSE, scree.size=.35)
##D 
##D ## example with no group information
##D plotGroves(res$treespace$pco)
##D 
##D ## adding labels
##D plotGroves(res$treespace$pco, lab.show=TRUE, lab.cex=2)
##D 
##D }
## End(Not run)




