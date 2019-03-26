library(acopula)


### Name: xPareto
### Title: 4-parametric univariate Pareto distribution
### Aliases: pPareto qPareto
### Keywords: Pareto distribution CDF quantile

### ** Examples

## probability P(X<q)=p
pPareto(t = 2.5, pars = c(10.,5.,3.,1))  # 0.8823436
qPareto(t = .Last.value, pars = c(10.,5.,3.,1))  # 2.5



