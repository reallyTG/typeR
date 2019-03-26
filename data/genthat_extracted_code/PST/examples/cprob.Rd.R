library(PST)


### Name: cprob
### Title: Empirical conditional probability distributions of order 'L'
### Aliases: cprob cprob,stslist-method
### Keywords: distribution

### ** Examples

## Example with the single sequence s1
data(s1)
s1 <- seqdef(s1)
cprob(s1, L=0, prob=FALSE)
cprob(s1, L=1, prob=TRUE)

## Preparing a sequence object with the SRH data set
data(SRH)
state.list <- levels(SRH$p99c01)
## sequential color palette
mycol5 <- rev(brewer.pal(5, "RdYlGn"))
SRH.seq <- seqdef(SRH, 5:15, alphabet=state.list, states=c("G1", "G2", "M", "B2", "B1"), 
	labels=state.list, weights=SRH$wp09lp1s, right=NA, cpal=mycol5)
names(SRH.seq) <- 1999:2009

## Example 1: 0th order: weighted and unweigthed counts
cprob(SRH.seq, L=0, prob=FALSE, weighted=FALSE)
cprob(SRH.seq, L=0, prob=FALSE, weighted=TRUE)

## Example 2: 2th order: weighted and unweigthed probability distrib.
cprob(SRH.seq, L=2, prob=TRUE, weighted=FALSE)
cprob(SRH.seq, L=2, prob=TRUE, weighted=TRUE)



