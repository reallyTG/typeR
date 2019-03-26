library(ebal)


### Name: baltest.collect
### Title: Collect Covariate Balance Statistics
### Aliases: baltest.collect

### ** Examples


## load(Matching) to run this example
## create toy data: one treatment indicator and three covariates X1-3
#dat <- data.frame(treatment=rbinom(50,size=1,prob=.5),replicate(3,rnorm(50)))
#covarsname <- colnames(dat)[-1]

## run balance checks
#mout <- MatchBalance(treatment~X1+X2+X3,data=dat)

## summarize in balance table
#baltest.collect(matchbal.out=mout,var.names=covarsname,after=FALSE)




