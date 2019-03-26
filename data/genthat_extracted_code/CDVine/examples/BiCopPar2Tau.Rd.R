library(CDVine)


### Name: BiCopPar2Tau
### Title: Kendall's tau value of a bivariate copula
### Aliases: BiCopPar2Tau

### ** Examples

## Example 1: Gaussian copula
tt1 = BiCopPar2Tau(1,0.7)

# transform back
BiCopTau2Par(1,tt1)


## Example 2: Clayton copula
BiCopPar2Tau(3,1.3)



