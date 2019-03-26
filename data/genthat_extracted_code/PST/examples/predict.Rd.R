library(PST)


### Name: predict
### Title: Compute the probability of categorical sequences using a
###   probabilistic suffix tree
### Aliases: predict predict,PSTf-method
### Keywords: models

### ** Examples

data(s1)
s1 <- seqdef(s1)

S1 <- pstree(s1, L=3, nmin=2, ymin=0.001)
S1 <- prune(S1, gain="G1", C=1.20, delete=FALSE)

predict(S1, s1, decomp=TRUE)
predict(S1, s1)



