library(DiPhiSeq)


### Name: robnb
### Title: Calculates the estimate and standard error of beta and phi. It
###   takes as input counts from one group of samples for a single gene.
###   This function is the core underlining function of the whole package.
###   A significant part of the code is edited based on William H.
###   Aeberhard's glmrob.nb R function; we appreciate them very much for
###   sharing their code online. This function also implement Algorithm 1
###   of our submitted paper about DiPhiSeq. This function is called by
###   robtest. Most users don't need to call this function directly.
### Aliases: robnb

### ** Examples

d <- runif(10, min=1, max=2)
y <- rnbinom(10, size=1, mu=d*50)
res <- robnb(y, log(d))



