library(HDGLM)


### Name: DGP
### Title: Data Generate Process
### Aliases: DGP

### ** Examples

alpha=runif(5,min=0,max=1)
## Example 1: Linear model
## H_0:  \beta_0=0
DGP_0=DGP(80,320,alpha)

## Example 2: Logistic model
## H_0:  \beta_0=0
DGP_0=DGP(80,320,alpha,model="logistic")

## Example 3:  Linear model with the first five coefficients to be nonzero,
## the square of the norm of the coefficients to be 0.2
DGP_0=DGP(80,320,alpha,sqrt(0.2),5)



