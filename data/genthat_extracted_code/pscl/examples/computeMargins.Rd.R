library(pscl)


### Name: computeMargins
### Title: add information about voting outcomes to a rollcall object
### Aliases: computeMargins
### Keywords: manip

### ** Examples

data(s109)
tmp <- computeMargins(s109)
dim(tmp$voteMargins)   ## 645 by 4

tmp <- computeMargins(s109,
                     dropList=list(codes="notInLegis",lop=0))
dim(tmp$voteMargins)   ## 544 by 4



