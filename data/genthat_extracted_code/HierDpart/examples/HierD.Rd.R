library(HierDpart)


### Name: HierD
### Title: Function to calculate and decompose genetic diversity (D, q=1)
###   and differentiation (Delta D)
### Aliases: HierD
### Keywords: Hierarchical genetic decomposition

### ** Examples

# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
hierD=HierD(infile,nreg=4,r=c(7,4,2,3),ncode=3)
print(hierD)


