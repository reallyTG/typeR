library(PST)


### Name: nobs
### Title: Extract the number of observations to which a VLMC model is
###   fitted
### Aliases: lnobs nobs,PSTf-method
### Keywords: models

### ** Examples

data(s1)
s1.seq <- seqdef(s1)
S1 <- pstree(s1.seq, L=3)
nobs(S1)

## Self rated health sequences
## Loading the 'SRH' data frame and 'SRH.seq' sequence object
data(SRH)

## model without considering missing states
## model with max. order 2 to reduce computing time
## nobs is the same whatever L and nmin
m1 <- pstree(SRH.seq, L=2, nmin=30, ymin=0.001)
nobs(m1)

## considering missing states, hence nobs is higher
m2 <- pstree(SRH.seq, L=2, nmin=30, ymin=0.001, with.missing=TRUE)
nobs(m2)



