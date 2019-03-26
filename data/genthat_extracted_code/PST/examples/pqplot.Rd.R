library(PST)


### Name: pqplot
### Title: Prediction quality plot
### Aliases: pqplot pqplot,PSTf,stslist-method
### Keywords: methods hplot

### ** Examples

data(s1)
s1 <- seqdef(s1)
S1 <- pstree(s1, L=3)

z <- seqdef("a-b-a-a-b")
pqplot(S1, z)
pqplot(S1, z, measure="logloss", plotseq=TRUE)



