library(rsm)


### Name: ccd.pick
### Title: Find a good central-composite design
### Aliases: ccd.pick
### Keywords: design

### ** Examples

library(rsm)

### List CCDs in 3 factors with between 10 and 14 runs per block
ccd.pick(3, n0.c=2:6, n0.s=2:8)
# (Generate the design that is listed first:) 
# ccd(3, n0=c(6,4))

### Find designs in 5 factors containing 1, 2, or 4 cube blocks
### of 8 or 16 runs, 1 or 2 reps of each axis point,
### and no more than 70 runs altogether
ccd.pick(5, n.c=c(8,16), blks.c=c(1,2,4), wbr.s=1:2, restrict="N<=70")



