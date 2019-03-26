library(PST)


### Name: pstree
### Title: Build a probabilistic suffix tree
### Aliases: pstree pstree,stslist-method
### Keywords: models

### ** Examples

## Build a PST on one single sequence
data(s1)
s1.seq <- seqdef(s1)
s1.seq
S1 <- pstree(s1.seq, L = 3)
print(S1, digits = 3)
S1



