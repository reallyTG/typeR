library(sampleSelection)


### Name: vcov.selection
### Title: Extract Variance Covariance Matrix
### Aliases: vcov.selection
### Keywords: methods

### ** Examples

## Estimate a simple female wage model taking into account the labour
## force participation
   data(Mroz87)
   a <- heckit(lfp ~ huswage + kids5 + mtr + fatheduc + educ + city,
               log(wage) ~ educ + city, data=Mroz87)
## extract the full variance-covariance matrix:
vcov( a )
## now extract the variance-covariance matrix of the outcome model only:
vcov( a, part = "outcome" )



