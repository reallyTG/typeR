library(hdi)


### Name: fdr.adjust
### Title: Function to calculate FDR adjusted p-values
### Aliases: fdr.adjust
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*1000), nrow = 100, ncol = 1000)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)

## Multi-splitting with lasso.firstq as model selector function
fit.multi <- multi.split(x, y, model.selector =lasso.firstq,
                         args.model.selector = list(q = 10))
p.adjust <- fdr.adjust(fit.multi$pval.corr)



