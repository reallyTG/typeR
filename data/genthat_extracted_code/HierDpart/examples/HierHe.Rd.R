library(HierDpart)


### Name: HierHe
### Title: Function to calculate hierarchical heterozygosity
### Aliases: HierHe
### Keywords: Hierarchical genetic decomposition

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
HiHe=HierHe(infile,nreg=4,r=c(7,4,2,3),ncode=3)
print(HiHe)



