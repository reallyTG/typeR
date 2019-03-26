library(metaSEM)


### Name: VarCorr
### Title: Extract Variance-Covariance Matrix of the Random Effects
### Aliases: VarCorr
### Keywords: methods

### ** Examples

## Multivariate meta-analysis on the log of the odds
## The conditional sampling covariance is 0
bcg <- meta(y=cbind(ln_Odd_V, ln_Odd_NV), data=BCG,
            v=cbind(v_ln_Odd_V, cov_V_NV, v_ln_Odd_NV))
VarCorr(bcg)



