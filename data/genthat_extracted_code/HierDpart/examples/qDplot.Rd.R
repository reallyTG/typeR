library(HierDpart)


### Name: qDplot
### Title: Plot the genetic diversity profiles (q=0,1,2)
### Aliases: qDplot
### Keywords: Plot Diversity profiles

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
# plot allelic richness
qDplot(infile,q=0,ncode=3)
#plot all three diversity profiles
qDplot(infile,q="all",ncode=3)


