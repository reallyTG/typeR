library(metaSEM)


### Name: BCG
### Title: Dataset on the Effectiveness of the BCG Vaccine for Preventing
###   Tuberculosis
### Aliases: BCG
### Keywords: datasets

### ** Examples

data(BCG)

## Univariate meta-analysis on the log of the odds ratio
summary( meta(y=ln_OR, v=v_ln_OR, data=BCG,
              x=cbind(scale(Latitude,scale=FALSE),
              scale(Year,scale=FALSE))) )

## Multivariate meta-analysis on the log of the odds
## The conditional sampling covariance is 0
bcg <- meta(y=cbind(ln_Odd_V, ln_Odd_NV), data=BCG,
            v=cbind(v_ln_Odd_V, cov_V_NV, v_ln_Odd_NV))
summary(bcg)

plot(bcg)



