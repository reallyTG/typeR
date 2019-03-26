library(chromoR)


### Name: correctPairCIM
### Title: Corrects a pairwise CIM
### Aliases: correctPairCIM
### Keywords: ~kwd1 ~kwd2

### ** Examples

# correction of a single pair
data(imr90.1.obs)
data(seg.imr90.obs)
# take a pairwise matrix and correct it 
indices = which(seg.imr90.obs$chr == "chr1")
i1 = indices[1]
iN = indices[length(indices)]
indices = which(seg.imr90.obs$chr == "chr2")
j1 = indices[1]
jN = indices[length(indices)]
m.1.2 = imr90.1.obs[i1:iN, j1:jN]
# set isCis to FALSE because we correct for a pair of different chromosomes
m.1.2.corrected = correctPairCIM(m.1.2, FALSE)
m.1.2.corrected



