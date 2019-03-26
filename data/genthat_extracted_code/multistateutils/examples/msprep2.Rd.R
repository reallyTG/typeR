library(multistateutils)


### Name: msprep2
### Title: Converts long state entry data into a format suitable for
###   multi-state modelling
### Aliases: msprep2

### ** Examples

 library(multistateutils)
 library(mstate)

 tmat <- trans.illdeath()
 entry <- data.frame(id=c(1, 2, 2),
                     state=c(2, 2, 3),
                     time=c(23, 35, 360))

 msprep2(entry, tmat)



