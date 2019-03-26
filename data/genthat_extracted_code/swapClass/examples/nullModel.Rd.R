library(swapClass)


### Name: nullModel
### Title: SwapClass null model
### Aliases: nullModel

### ** Examples

MAT=matrix(sample(0:3,50*20,replace=TRUE,prob=c(.7,.1,.1,.1)),ncol=20)

#Generation of null communities
NULL_MATS=nullModel(MAT)

#First null community
NULL_MATS$sim[[1]]

#Number of times that each cell has been swapped for the first null community
NULL_MATS$perms[[1]]

#nbPerm index over the observed community and the 100 null communities
plot(c(nbPerm(MAT),unlist(lapply(NULL_MATS$sim,nbPerm))),type='l',ylab="nbPerm index")

#the number of each classes per row are equal
#between observed community and the first null community
f_table = function(x) table(factor(x,levels=0:3))
all(apply(MAT,1,f_table)==apply(NULL_MATS$sim[[1]],1,f_table))

#the number of each classes per column are equal
#between observed community and the first null community
all(apply(MAT,2,f_table)==apply(NULL_MATS$sim[[1]],2,f_table))



