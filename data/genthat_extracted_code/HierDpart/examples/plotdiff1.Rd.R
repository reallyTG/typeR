library(HierDpart)


### Name: plotdiff1
### Title: Plot genetic differentiation (Delta D) across loci
### Aliases: plotdiff1
### Keywords: Plot Plot genetic differentiation

### ** Examples

##plot genetic differentiation across loci
# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
plotdiff1(infile,ncode=3)


