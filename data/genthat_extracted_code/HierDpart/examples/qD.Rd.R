library(HierDpart)


### Name: qD
### Title: Function to calculate genetic diversity profiles (q=0,1,2)
### Aliases: qD
### Keywords: Diversity profiles

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
qD(infile,q=0,ncode=3)



