library(DySeq)


### Name: single.LogSeq
### Title: single.LogSeq
### Aliases: single.LogSeq

### ** Examples

data(CouplesCope)
my.states<-StateExpand(CouplesCope, 2:49, 50:97)
my.trans<-StateTrans(my.states, FALSE)
my.logseq<-LogSeq(my.trans, single.case=TRUE)
my.logseq
single.LogSeq(my.logseq, 41)  # prints estimates for case 41




