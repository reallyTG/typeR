library(iopsych)


### Name: .solveWtVec
### Title: Correlation between weighted predictor composite and criterion.
### Aliases: .solveWtVec
### Keywords: internal

### ** Examples

library(iopsych)
data(dls2007)
dat <- dls2007[1:6, 2:7]
rxx <- dat[1:4, 1:4]
rxy <- dat[1:4, 5]
wt1 <- c(1,1,1,1)
wt2 <- c(1,2,3,4)
wt_list <- list(wt1, wt2)

#.solveWtVec(wt=wt1, rxx=rxx, rxy=rxy)
#.solveWtVec(wt=wt2, rxx=rxx, rxy=rxy)
#.solveWtVec(wt=wt_list, rxx=rxx, rxy=rxy)



