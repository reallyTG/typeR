library(treespace)


### Name: plotTreeDiff
### Title: Plot tree differences
### Aliases: plotTreeDiff

### ** Examples

## simple example on trees with five tips:
tr1 <- read.tree(text="((A:1,B:1):1,((C:1,D:1):1,E:1):1):1;")
tr2 <- read.tree(text="((A:1,B:1):1,(C:1,(D:1,E:1):1):1):1;")
plotTreeDiff(tr1,tr2)

## example on larger woodmice trees
data(woodmiceTrees)
tr1 <- woodmiceTrees[[1]]
tr2 <- woodmiceTrees[[57]] # for example

# find the tip differences in advance, to avoid recalculating with each plot
wmTipDiff <- tipDiff(tr1,tr2, sizeOfDifferences=TRUE)
plotTreeDiff(tr1,tr2, tipDiff=wmTipDiff, tipMatch=TRUE)

## change aesthetics:
# trees facing each other:
plotTreeDiff(tr1,tr2, tipDiff=wmTipDiff, treesFacing=TRUE)

# radial plots, and change colours:
plotTreeDiff(tr1,tr2, tipDiff=wmTipDiff,
   baseCol="grey2", col1="cyan", col2="navy", 
   edge.width=2, type="radial", cex=0.5, font=2)
# cladogram plots, and use colour palette from adegenet to see differences more clearly:
plotTreeDiff(tr1,tr2, tipDiff=wmTipDiff,
   treesFacing=TRUE, baseCol="black", colourMethod="palette", 
   edge.width=2, type="cladogram", cex=0.5, font=2)    

# including the size of the differences highlights tip "No0906s" a little more:
# (this is typically a more informative plot in cases where many tips have the 
# same difference count, for example when a whole clade has been shifted "up" 
# or "down" the tree but its internal topology remains the same.) 
 
plotTreeDiff(tr1,tr2, tipDiff=wmTipDiff, sizeOfDifferences=TRUE,
   treesFacing=TRUE, baseCol="black", colourMethod="palette", 
   edge.width=2, type="cladogram", cex=0.5, font=2)  




