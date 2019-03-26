library(multgee)


### Name: matrixLOR
### Title: Creating A Probability Matrix With Specified Local Odds Ratios
### Aliases: matrixLOR

### ** Examples

## Illustrating the construction of a "fixed" local odds ratios structure 
## using the arthritis dataset. Here, we assume a uniform local odds ratios 
## structure equal to 2 for each time pair.

## Create the uniform local odds ratios structure.
lorterm <- matrixLOR(matrix(2,4,4))

## Create the LORterm argument.
lorterm <- c(lorterm)
lorterm <- matrix(c(lorterm),3,25,TRUE)

## Fit the marginal model.
data(arthritis)
fitmod.fixed <- ordLORgee(y~factor(trt)+factor(time)+factor(baseline),data=arthritis,
                id=id,repeated=time,LORstr="fixed",LORterm=lorterm)
fitmod.fixed



