library(chromoR)


### Name: correctCIM
### Title: Corrects a chromosomal interactions map (CIM)
### Aliases: correctCIM
### Keywords: ~kwd1 ~kwd2

### ** Examples

# correction
data(imr90.1.obs) #contact map of imr90 (replicate 1) 
                  #for chromosomes 1 and 2, before correction 
data(seg.imr90.obs) 
head(seg.imr90.obs)
res = correctCIM(imr90.1.obs, seg.imr90.obs, removeUncovered = TRUE)
# the corrected CIM - look at the first cell in the matrix.
# Note the difference in dimensions 
#(with respect to imr90.1.orig) since we set removeUncevered to TRUE
(res$mCorrected)[1,1]
dim(res$mCorrected)
# the coordinates for the corrected matrix 
head(res$seg)
nrow(res$seg)



