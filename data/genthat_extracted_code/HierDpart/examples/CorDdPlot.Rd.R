library(HierDpart)


### Name: CorDdPlot
### Title: Plot the relation between genetic differentiation (Delta D) and
###   geographic distance
### Aliases: CorDdPlot
### Keywords: Correlation plot Plot genetic differentiation

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
CorDdPlot(infile,d=FALSE,ncode=3)



