library(iopsych)


### Name: .solveWtExp
### Title: Correlation between weighted predictor composite and criterion.
### Aliases: .solveWtExp
### Keywords: internal

### ** Examples

library(iopsych)
data(dls2007)
dat <- dls2007[1:6, 2:7]
rxx <- dat[1:4, 1:4]
rxy1 <- dat[1:4, 5]
rxy2 <- dat[1:4, 6]
rxy_list <- list(rxy1, rxy2)

wt1 <- c(1,1,1,1)
wt2 <- c(1,2,3,4)
wt_mat <- rbind(wt1, wt2)

#.solveWtExp(wt=wt_mat, rxx=rxx, rxy_list=rxy_list)



