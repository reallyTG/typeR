library(HierDpart)


### Name: HierFst
### Title: Function to calculate hierarchical genetic differentiation (Fst)
###   (Weir B.S., 1996; Yang R.C.,1998)
### Aliases: HierFst
### Keywords: Hierarchical genetic decomposition

### ** Examples
#
# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
 hFst=HierFst(infile, nreg=4, r=c(7,4,2,3), ncode=3)
 print(hFst)


