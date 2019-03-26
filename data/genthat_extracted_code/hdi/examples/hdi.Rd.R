library(hdi)


### Name: hdi
### Title: Function to perform inference in high-dimensional (generalized)
###   linear models
### Aliases: hdi
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*1000), nrow = 100, ncol = 200)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)

## Multi-splitting with lasso.firstq as model selector function
fit.multi <- hdi(x, y, method = "multi.split",
                 model.selector =lasso.firstq,
                 args.model.selector = list(q = 10))
fit.multi
fit.multi$pval.corr[1:10] ## the first 10 p-values

## Stability selection
fit.stab <- hdi(x, y, method = "stability", EV = 2)
fit.stab
fit.stab$freq[1:10] ## frequency of the first 10 predictors



