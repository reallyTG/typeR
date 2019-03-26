library(TraMineR)


### Name: seqLLCS
### Title: Compute the length of the longest common subsequence of two
###   sequences
### Aliases: seqLLCS
### Keywords: Dissimilarity measures

### ** Examples

LCS.ex <- c("S-U-S-M-S-U", "U-S-SC-MC", "S-U-M-S-SC-UC-MC")
LCS.ex <- seqdef(LCS.ex)
seqLLCS(LCS.ex[1,],LCS.ex[3,])



