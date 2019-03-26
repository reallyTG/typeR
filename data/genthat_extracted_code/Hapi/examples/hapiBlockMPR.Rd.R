library(Hapi)


### Name: hapiBlockMPR
### Title: Maximum Parsimony of Recombination (MPR) for proofreading of
###   draft haplotypes
### Aliases: hapiBlockMPR

### ** Examples

ref <- rep(0,500)
alt <- rep(1,500)

gmtFrame <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)

idx1 <- sort(sample(seq_len(500), 30, replace = FALSE))
idx2 <- sort(sample(seq_len(500), 30, replace = FALSE))
idx3 <- sort(sample(seq_len(500), 30, replace = FALSE))

gmtFrame[idx1,1] <- NA
gmtFrame[idx2,2] <- NA
gmtFrame[idx3,3] <- NA

imputedFrame <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)

draftHap <- hapiPhase(imputedFrame)

finalDraft <- hapiBlockMPR(draftHap, gmtFrame, cvlink=2, smallBlock=100)



