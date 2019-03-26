library(Epi)


### Name: ci.pd
### Title: Compute confidence limits for a difference of two independent
###   proportions.
### Aliases: ci.pd
### Keywords: distribution htest

### ** Examples

( a <- matrix( sample( 10:40, 4 ), 2, 2 ) )
ci.pd( a )
twoby2( t(a) )
prop.test( t(a) )
( A <- array( sample( 10:40, 20 ), dim=c(2,2,5) ) )
ci.pd( A )
ci.pd( A, detail.labs=TRUE, digits=3 )



