library(chromoR)


### Name: segmentCIM
### Title: Segments a 1D contact profile (1D CIM)
### Aliases: segmentCIM
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(imr90.1) # corrected contact map of imr90 (replicate 1) for chromosomes 1,2 
data(seg)
#generate a 1D profile for cis CIM of chromosome 2
indices = which(seg$chr == "chr2")
i1 = indices[1]
iN = indices[length(indices)]
p = rowSums(imr90.1[i1:iN, i1:iN]) - diag(imr90.1[i1:iN, i1:iN])
res = segmentCIM(p)
res



