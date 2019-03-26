library(PST)


### Name: ppplot
### Title: Plotting a branch of a probabilistic suffix tree
### Aliases: ppplot ppplot,PSTf-method
### Keywords: hplot

### ** Examples

data(s1)
s1.seq <- seqdef(s1)
S1 <- pstree(s1.seq, L=5, ymin=0.001)
ppplot(S1, "a-a-b-b-a", gain="G1", C=c(1.1, 1.2))



