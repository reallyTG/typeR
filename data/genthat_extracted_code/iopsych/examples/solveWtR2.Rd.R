library(iopsych)


### Name: solveWtR2
### Title: Find R2 given arbitrary predictor weights
### Aliases: solveWtR2

### ** Examples

library(iopsych)
#Get Data
data(dls2007)
r_mat <- dls2007[1:6, 2:7]

#Get weights
unit_wt <- c(1,1,1,1)
other_wt <- c(1,2,1,.5)
wt_list <- list(unit_wt, other_wt)

#Solve
solveWtR2(r_mat=r_mat, y_col=6, x_col=1:4, wt=unit_wt)
solveWtR2(r_mat=r_mat, y_col=6, x_col=1:4, wt=other_wt)
solveWtR2(r_mat=r_mat, y_col=6, x_col=1:4, wt=wt_list)



