library(rwt)


### Name: threshold
### Title: Threshold Input Signal
### Aliases: hardTh softTh
### Keywords: interface

### ** Examples

sig <- makesig(SIGNAL.WERNER.SORROWS, 8)
thld <- 1
x <- rwt:::hardTh(sig$x, thld)



