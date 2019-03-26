library(DySeq)


### Name: LogSeq
### Title: LogSeq
### Aliases: LogSeq

### ** Examples

## Not run: 
##D data(CouplesCope)
##D my.states<-StateExpand(CouplesCope, 2:49, 50:97)
##D my.trans<-StateTrans(my.states, FALSE)
##D my.logseq<-LogSeq(my.trans, single.case=TRUE)
##D my.logseq
##D 
##D plot(my.logseq) # interaction can be plotted
##D 
##D single.LogSeq(my.logseq, 41) # for single case analysis
## End(Not run)



