library(sac)


### Name: BootsModelTest
### Title: Bootstrap Test of the Validity of the Semiparametric
###   Change-Point Model
### Aliases: BootsModelTest
### Keywords: htest

### ** Examples

## Nile data with one change-point: the annual flows drop in 1898.
## It is believed to be caused by the building of the first Aswan dam.
if(! "package:stats" %in% search()) library(stats)
data(Nile)
require(sac) #load the package
Nile.res<-SemiparChangePoint(Nile, alternative = "one.change")
BootsModelTest(Nile, Nile.res$k.hat, length(Nile), B=5, Nile.res$alpha.hat, 
    Nile.res$beta.hat)
    # Choose larger B to get better approximate p-value.
    # It takes longer to do bootstrap model test for large B.



