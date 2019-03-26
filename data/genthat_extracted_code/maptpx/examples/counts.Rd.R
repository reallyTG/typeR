library(maptpx)


### Name: counts
### Title: Utilities for count matrices
### Aliases: stm_tfidf normalize

### ** Examples

normalize( matrix(1:9, ncol=3) )
normalize( matrix(1:9, ncol=3), byrow=FALSE )

(x <- matrix(rbinom(15,size=2,prob=.25),ncol=3))
stm_tfidf(x)



