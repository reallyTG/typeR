library(lmomRFA)


### Name: reglmr
### Title: Regional weighted average of L-moments
### Aliases: reglmr
### Keywords: misc

### ** Examples

(xmom<-t(sapply(Maxwind,samlmu)))
nrec<-sapply(Maxwind,length)
reglmr(xmom,nrec)   # weighted by record length
reglmr(xmom)        # unweighted



