library(HierDpart)


### Name: COR_DeltaDd
### Title: Function to calculate pairwise Delta D and correlation between
###   genetic differentiation (Delta D) and geographic distance
### Aliases: COR_DeltaDd
### Keywords: Correlation between genetic differentiation and geographic
###   distance

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
d1=COR_DeltaDd(infile,d=FALSE,ncode=3)
print(d1)


