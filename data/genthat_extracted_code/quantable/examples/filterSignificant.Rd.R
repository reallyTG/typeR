library(quantable)


### Name: filterSignificant
### Title: filters significant values and returns them as list of
###   data.frames
### Aliases: filterSignificant

### ** Examples

library(quantable)
foldchange <- rnorm(1000)
pvals <-rexp(1000)
filterSignificant(foldchange, pvals,
 rep("blabla",length(pvals)), pthresh=0.1, foldchangethresh=1)
filterSignificant(foldchange[foldchange>0], pvals[foldchange>0],
 rep("blabla",length(pvals[foldchange>0])), pthresh=0.1, foldchangethresh=1)
filterSignificant(foldchange[foldchange<0], pvals[foldchange<0],
 rep("blabla",length(pvals[foldchange<0])), pthresh=0.1, foldchangethresh=1)
tt <- filterSignificant(foldchange, pvals,
 rep("blabla",length(pvals)), pthresh=0.1, foldchangethresh=10)



