library(chromoR)


### Name: compareCIM
### Title: Compares 2 CIMs
### Aliases: compareCIM
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(imr90.1) # corrected contact map of imr90 (replicate 1) for chromosomes 1,2 
data(imr90.2) # corrected contact map of imr90 (replicate 2) for chromosomes 1,2 
data(seg)
# compare replicates of the same celll type
res = compareCIM(imr90.1, imr90.2, seg) 
# no significant changes identified
res$sigChanges



