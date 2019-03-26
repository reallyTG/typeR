library(PST)


### Name: summary-methods
### Title: Summary of variable length Markov chain model
### Aliases: summary,PSTf-method summary,PSTr-method
### Keywords: methods

### ** Examples

data(s1)
s1.seq <- seqdef(s1)
S1 <- pstree(s1.seq, L=3)
summary(S1)
summary(S1, max.level=2)



