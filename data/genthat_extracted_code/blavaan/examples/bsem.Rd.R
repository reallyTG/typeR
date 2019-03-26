library(blavaan)


### Name: bsem
### Title: Fit Structural Equation Models
### Aliases: bsem

### ** Examples

## Not run: 
##D ## The industrialization and Political Democracy Example 
##D ## Bollen (1989), page 332
##D model <- ' 
##D   # latent variable definitions
##D      ind60 =~ x1 + x2 + x3
##D      dem60 =~ y1 + a*y2 + b*y3 + c*y4
##D      dem65 =~ y5 + a*y6 + b*y7 + c*y8
##D 
##D   # regressions
##D     dem60 ~ ind60
##D     dem65 ~ ind60 + dem60
##D 
##D   # residual correlations
##D     y1 ~~ y5
##D     y2 ~~ y4 + y6
##D     y3 ~~ y7
##D     y4 ~~ y8
##D     y6 ~~ y8
##D '
##D 
##D ## unique priors for mv intercepts; parallel chains
##D fit <- bsem(model, data=PoliticalDemocracy,
##D             dp=dpriors(nu="dnorm(5,1e-2)"),
##D             bcontrol=list(method="rjparallel"))
##D summary(fit)
## End(Not run)



