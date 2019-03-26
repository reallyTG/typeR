library(robustfa)


### Name: compute_cov_cor
### Title: Compute the Robust Covariance and Correlation Matrix of A
###   Numeric Matrix
### Aliases: compute_cov_cor
### Keywords: robust

### ** Examples

data("hbk")
hbk.x = hbk[,1:3]

compute_cov_cor(x = hbk.x, control = "mcd")




