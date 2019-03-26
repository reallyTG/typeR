library(horserule)


### Name: Variable_importance
### Title: Variable Importance plot
### Aliases: Variable_importance

### ** Examples

#Fit HorseRuleFit
x = matrix(rnorm(5000), ncol=10)
y = apply(x,1,function(x)sum(x[1:5])+rnorm(1))
hrres = HorseRuleFit(X = x, y=y,
                     thin=1, niter=100, burnin=10,
                     L=5, S=6, ensemble = "both", mix=0.3, ntree=100,
                     intercept=FALSE, linterms=1:10,
                     alpha=1, beta=2, linp = 1, restricted = 0)
Variable_importance(hrres)



