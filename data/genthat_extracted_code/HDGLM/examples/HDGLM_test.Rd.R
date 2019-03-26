library(HDGLM)


### Name: HDGLM_test
### Title: Tests the Coefficients of High Dimensional Generalized Linear
###   Models
### Aliases: HDGLM_test

### ** Examples

## Example: Linear model
## Global test: if the null hypothesis is true (beta_0=0)
alpha=runif(5,min=0,max=1)
## Generate the data
DGP_0=DGP(80,320,alpha)
result=HDGLM_test(DGP_0$Y,DGP_0$X)
## Pvalue
result$test_pvalue

## Global test: if the alternative hypothesis is true
## (the square of the norm of the first 5 nonzero coefficients to be 0.2)
## Generate the data
DGP_0=DGP(80,320,alpha,sqrt(0.2),5)
result=HDGLM_test(DGP_0$Y,DGP_0$X)
## Pvalue
result$test_pvalue

## Test with nuisance coefficients: if the null hypothesis is true (beta_0^{(2)}=0)
## The first 10 coefficients to be the nuisance coefficients
betanui=runif(10,min=0,max=1)
## Generate the data
DGP_0=DGP(80,320,alpha,0,no=NA,betanui)
result=HDGLM_test(DGP_0$Y,DGP_0$X,nuisance=c(1:10))
## Pvalue
result$test_pvalue

## Test with nuisance coefficients: if the alternative hypothesis is true
## (the square of the norm of the first 5 nonzero coefficients in beta_0^{(2)} to be 2)
## The first 10 coefficients to be the nuisance coefficients
betanui=runif(10,min=0,max=1)
## Generate the data
DGP_0=DGP(80,330,alpha,sqrt(2),no=5,betanui)
result=HDGLM_test(DGP_0$Y,DGP_0$X,nuisance=c(1:10))
## Pvalue
result$test_pvalue



