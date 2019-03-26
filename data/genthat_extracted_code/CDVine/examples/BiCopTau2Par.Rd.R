library(CDVine)


### Name: BiCopTau2Par
### Title: Parameter of a bivariate copula for a given Kendall's tau value
### Aliases: BiCopTau2Par

### ** Examples

## Example 1: Gaussian copula
tt1 = BiCopTau2Par(1,0.5)

# transform back
BiCopPar2Tau(1,tt1)


## Example 2: Clayton copula
BiCopTau2Par(3,0.4)



