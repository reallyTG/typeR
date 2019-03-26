library(Runuran)


### Name: use.aux.urng-method
### Title: Use auxiliary random number generator for Runuran objects
### Aliases: use.aux.urng use.aux.urng-method use.aux.urng,unuran-method
###   use.aux.urng<- use.aux.urng<--method use.aux.urng<-,unuran-method
###   set.aux.seed
### Keywords: methods datagen

### ** Examples

## Create respective generators for normal and exponential distribution.
## Use method TDR
gen1 <- tdrd.new(udnorm())
gen2 <- tdrd.new(udexp())

## The two streams are independent even we use the same seed
set.seed(123); x1 <- ur(gen1,1e5)
set.seed(123); x2 <- ur(gen2,1e5)
cor(x1,x2)

## We can enable the auxiliary URNG and get correlated streams
use.aux.urng(gen1) <- TRUE
use.aux.urng(gen2) <- TRUE
set.seed(123); x1 <- ur(gen1,1e5)
set.seed(123); x2 <- ur(gen2,1e5)
cor(x1,x2)

## This feature can be disabled again
use.aux.urng(gen1)
use.aux.urng(gen1) <- FALSE
use.aux.urng(gen2) <- FALSE

## Notice that TDR cannot simply mixed with an inversion method
## as the number of URNG per random point differs
gen3 <- pinvd.new(udexp())
set.seed(123); x3 <- ur(gen3,1e5)
cor(x1,x3)

## But a trick would do this
set.seed(123); x3 <- ur(gen3,2*1e5)
x3 <- x3[seq(1,2*1e5,2)]
cor(x1,x3)
## or ...
set.seed(123); u3 <- runif(2*1e5); u3 <- u3[seq(1,2*1e5,2)]
x3 <- uq(gen3,u3)
cor(x1,x3)

## Maybe method AROU is more appropriate
gen4 <- unuran.new(udnorm(), "arou")
use.aux.urng(gen4) <- TRUE
set.seed(123); x3 <- ur(gen3,1e5)
set.seed(123); x4 <- ur(gen4,1e5)
cor(x3,x4)




