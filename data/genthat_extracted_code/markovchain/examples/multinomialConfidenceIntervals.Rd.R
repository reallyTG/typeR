library(markovchain)


### Name: multinomialConfidenceIntervals
### Title: A function to compute multinomial confidence intervals of DTMC
### Aliases: multinomialConfidenceIntervals

### ** Examples

seq<-c("a", "b", "a", "a", "a", "a", "b", "a", "b", "a", "b", "a", "a", "b", "b", "b", "a")
mcfit<-markovchainFit(data=seq,byrow=TRUE)
seqmat<-createSequenceMatrix(seq)
multinomialConfidenceIntervals(mcfit$estimate@transitionMatrix, seqmat, 0.95)



