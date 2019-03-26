library(BOIN)


### Name: next.subtrial
### Title: Determine the starting dose and the dose-searching space for
###   next subtrial in waterfall design
### Aliases: next.subtrial

### ** Examples


## determine the starting dose and dose searching space for next subtrial
n <- matrix(c(6, 0, 0, 0,
           6, 10, 12, 0,
           9, 12, 0, 0), ncol=4, byrow=TRUE)
y <- matrix(c(0, 0, 0, 0,
            1, 1, 4, 0,
            2, 3, 0, 0), ncol=4, byrow=TRUE)
nxt.trial <- next.subtrial(target=0.3, npts=n, ntox=y)
summary.boin(nxt.trial)





