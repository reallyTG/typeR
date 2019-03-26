library(HCmodelSets)


### Name: DGP
### Title: Data generating process used by Battey, H. S. & Cox, D. R.
###   (2018).
### Aliases: DGP

### ** Examples

## Generates DGP
## No test: 
## Generates a random DGP
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=100, intercept=5, noise=1,
          var=1, d=1000, DGP.seed = 2018)
          
## End(No test)
## Don't show: 
dgp = DGP(s=5, a=3, sigStrength=1, rho=0.9, n=20, intercept=5, noise=1,
          var=1, d=50, DGP.seed = 2019)

## End(Don't show)



