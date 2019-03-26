library(trioGxE)


### Name: trioGxE
### Title: Generalized additive model estimation of gene-environment
###   interaction using data from case-parent trios
### Aliases: trioGxE
### Keywords: methods models smooth regression

### ** Examples


## fitting a co-dominant model
data(hypoTrioDat)
simfit <- trioGxE(data=hypoTrioDat,pgenos=c("parent1","parent2"),cgeno="child",cenv="attr",
                  k=c(5,5),knots=NULL,sp=NULL)

## fitting a dominant model to the hypothetical data
simfit.dom <- trioGxE(data=hypoTrioDat,pgenos=c("parent1","parent2"),cgeno="child",cenv="attr",
                      penmod="dom",k=5,knots=NULL,sp=NULL)



