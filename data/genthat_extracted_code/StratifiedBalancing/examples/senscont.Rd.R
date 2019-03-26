library(StratifiedBalancing)


### Name: senscont
### Title: senscont()
### Aliases: senscont
### Keywords: ~kwd1 ~kwd2

### ** Examples

## In this example we will generate a matrix with a large number of
## covariates and a small number of observations. No model will be
## built into the data, our goal here is to demonstrate how sensitivty
## analysis would be performed.

## Firstly a matrix with 10 columns and 1000 observations will be created
m=matrix(nrow=1000,ncol=10)
for(i in 1:ncol(m)){
m[,i]=rbinom(1000,1,0.5)
}

## We will populate the 10th column randomly from the normal distribtuion
m[,10]=rnorm(1000,0,1)
## Next we will run function sensdisc() on the data.
g=senscont(9,10,m)




