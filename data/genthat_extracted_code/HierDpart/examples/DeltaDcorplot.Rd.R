library(HierDpart)


### Name: DeltaDcorplot
### Title: Plot correlation matrix for pairwise Delta D
### Aliases: DeltaDcorplot
### Keywords: Correlation plot Plot genetic differentiation

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
DeltaDcorplot(infile,ncode=3)



