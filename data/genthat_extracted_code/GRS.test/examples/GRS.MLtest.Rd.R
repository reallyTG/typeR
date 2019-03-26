library(GRS.test)


### Name: GRS.MLtest
### Title: GRS Test Statistic and p-value based on Maximum Likelihood
###   Estimator for Covariance matrix
### Aliases: GRS.MLtest
### Keywords: htest

### ** Examples

data(data)
factor.mat = data[1:342,2:4]            # Fama-French 3-factor model
ret.mat = data[1:342,8:ncol(data)]      # 25 size-BM portfolio returns
GRS.MLtest(ret.mat,factor.mat)          # See column (iv), Table 9C of Fama-French (1993)




