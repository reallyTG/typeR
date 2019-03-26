library(trioGxE)


### Name: plot.trioGxE
### Title: Graphical display of gene-environment interaction between a SNP
###   and a continuous non-genetic attribute in case-parent trio data
### Aliases: plot.trioGxE
### Keywords: methods models smooth regression hplot

### ** Examples

data(hypoTrioDat)

## fitting a co-dominant model to the hypothetical data
simfit <- trioGxE(data=hypoTrioDat,pgenos=c("parent1","parent2"),cgeno="child",cenv="attr",
                  k=c(5,5),knots=NULL,sp=NULL)

## produce the graphical display of the point- and interval-estimates of GxE curve 
plot.trioGxE(simfit) # or just plot(simfit)




