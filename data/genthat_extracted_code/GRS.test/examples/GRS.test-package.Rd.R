library(GRS.test)


### Name: GRS.test-package
### Title: GRS Test for Portfolio Efficiency, Its Statistical Power
###   Analysis, and Optimal Significance Level Calculation
### Aliases: GRS.test-package
### Keywords: package

### ** Examples

data(data)
factor.mat = data[1:342,2:4]            # Fama-French 3-factor model
ret.mat = data[1:342,8:ncol(data)]      # 25 size-BM portfolio returns
GRS.test(ret.mat,factor.mat)$GRS.stat   # Table 9C of Fama-French (1993)



