library(freqdom)


### Name: timedom.norms
### Title: Compute operator norms of elements of a filter
### Aliases: timedom.norms
### Keywords: time.domain

### ** Examples

d = 2

A = array(0,c(d,d,2))
A[1,,] = 2 * diag(d:1)/d
A[2,,] = 1.5 * diag(d:1)/d
OP = timedom(A,c(-2,1))
timedom.norms(OP)



