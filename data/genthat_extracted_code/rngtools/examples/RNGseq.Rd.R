library(rngtools)


### Name: RNGseq
### Title: Generate Sequence of Random Streams
### Aliases: RNGseq RNGseq_seed

### ** Examples

#--- RNGseq ---

RNGseq(3)
RNGseq(3)
RNGseq(3, seed=123)
# or identically
set.seed(123)
identical(RNGseq(3), RNGseq(3, seed=123))
## Don't show: 
set.seed(123)
stopifnot( identical(RNGseq(3), RNGseq(3, seed=123)) ) 
## End(Don't show)

RNGseq(3, seed=1:6, verbose=TRUE)
# select Normal kind
RNGseq(3, seed=123, normal.kind="Ahrens")


#--- RNGseq_seed ---

## generate a seed for RNGseq
# random  
RNGseq_seed() 
RNGseq_seed()
RNGseq_seed(NULL)
# fixed
RNGseq_seed(1)
RNGseq_seed(1:6)

# `RNGseq_seed(1)` is identical to 
set.seed(1)
s <- RNGseq_seed()
identical(s, RNGseq_seed(1))
## Don't show: 
 stopifnot(identical(s, RNGseq_seed(1))) 
## End(Don't show)
 




