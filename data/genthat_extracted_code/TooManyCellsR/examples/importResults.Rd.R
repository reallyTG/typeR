library(TooManyCellsR)


### Name: importResults
### Title: Import some 'too-many-cells make-tree' outputs into a data
###   frame.
### Aliases: importResults

### ** Examples

input <- system.file("extdata", "mat.csv", package="TooManyCellsR")
inputLabels <- system.file("extdata", "labels.csv", package="TooManyCellsR")
df = read.csv(input, row.names = 1, header = TRUE)
mat = Matrix::Matrix(as.matrix(df), sparse = TRUE)
labelsDf = read.csv(inputLabels, header = TRUE)
# Here we draw this small toy example with no filter or normalization, and
# decrease the size of the branches and increase the size of the leaf nodes.
# With non-toy real world single cell data, these options should not be
# necessary.
## Not run: 
##D tooManyCells( mat, labels = labelsDf
##D             , args = c( "make-tree"
##D                       , "--no-filter"
##D                       , "--normalization", "NoneNorm"
##D                       , "--draw-max-node-size", "40"
##D                       , "--draw-max-leaf-node-size", "70"
##D                       )
##D             )
##D res = importResults("out")
##D plot(res$treePlot, axes = FALSE)
## End(Not run)



