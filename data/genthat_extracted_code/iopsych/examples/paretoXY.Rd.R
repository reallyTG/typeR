library(iopsych)


### Name: paretoXY
### Title: Computes data needed for a XY Pareto plot.
### Aliases: paretoXY

### ** Examples

data(dls2007)
dat <- dls2007
r_mat <- dat[1:6, 2:7]
x_col <- 1:4 
y_col <- 5:6
d_vec <- dat[1:4, 1]

paretoXY(r_mat=r_mat, x_col=1:4, y_col=5, d_vec=d_vec, pred_lower=c(0,0,0,0))
paretoXY(r_mat=r_mat, x_col=1:4, y_col=c(5,6))



