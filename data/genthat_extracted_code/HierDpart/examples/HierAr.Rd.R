library(HierDpart)


### Name: HierAr
### Title: Function to calculate hierarchical allelic richness
### Aliases: HierAr
### Keywords: Hierarchical genetic decomposition

### ** Examples

#we want to calculate the hierarchical allelic richness of
#16 populations structured in a 4 regions.
#Each region contains 7,4,2,3 populations.
# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
HAr=HierAr(infile, nreg=4, r=c(7,4,2,3), ncode=3)
HAr



