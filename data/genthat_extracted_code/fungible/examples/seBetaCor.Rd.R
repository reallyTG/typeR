library(fungible)


### Name: seBetaCor
### Title: Standard Errors and CIs for Standardized Regression Coefficients
###   from Correlations
### Aliases: seBetaCor
### Keywords: Statistics

### ** Examples

R <- matrix(c(1.0000, 0.3511, 0.3661,
	          0.3511, 1.0000, 0.4359,
	          0.3661, 0.4359, 1.0000), 3, 3) 

rxy <- c(0.5820, 0.6997, 0.7621)
Nobs <- 46
out <- seBetaCor(R = R, rxy = rxy, Nobs = Nobs) 

# 95% CIs for Standardized Regression Coefficients: 
#
#        lbound estimate ubound
# beta_1  0.107    0.263  0.419
# beta_2  0.231    0.391  0.552
# beta_3  0.337    0.495  0.653



