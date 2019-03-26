library(dae)


### Name: designPlot
### Title: A graphical representation of an experimental design using
###   labels stored in a matrix.
### Aliases: designPlot
### Keywords: design plot

### ** Examples
## Not run: 
##D   designPlot(des.mat, labels=1:4, cellfillcolour="lightblue", new=TRUE, 
##D              plotcellboundary = TRUE, chardivisor=3, 
##D              rtitle="Lanes", ctitle="Positions", 
##D              rcellpropn = 1, ccellpropn=1)
##D   designPlot(des.mat, labels=5:87, plotlabels=TRUE, cellfillcolour="grey", new=FALSE,
##D              plotcellboundary = TRUE, chardivisor=3)
##D   designPlot(des.mat, labels=88:434, plotlabels=TRUE, cellfillcolour="lightgreen", 
##D              new=FALSE, plotcellboundary = TRUE, chardivisor=3, 
##D              blocksequence=TRUE, blockdefinition=cbind(4,10,12), 
##D              blocklinewidth=3, blockcolour="blue")
## End(Not run)


