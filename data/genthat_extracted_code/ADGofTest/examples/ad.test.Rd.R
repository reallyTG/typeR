library(ADGofTest)


### Name: ad.test
### Title: Anderson-Darling GoF test
### Aliases: ad.test
### Keywords: htest

### ** Examples

    set.seed( 123 )
    x <- runif( 100 )

    ad.test( x )$p.value

    ad.test( x, pnorm, 0, 1 )$p.value

    replicate( ad.test( rnorm( 100 ), pnorm )$p.value, 100 )



