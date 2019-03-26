library(hdi)


### Name: ridge.proj
### Title: P-values based on ridge projection method
### Aliases: ridge.proj
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100 * 100), nrow = 100, ncol = 100)
y <- x[,1] + x[,2] + rnorm(100)
fit.ridge <- ridge.proj(x, y)
which(fit.ridge$pval.corr < 0.05)

## Use the scaled lasso for the initial estimate
fit.ridge.scaled  <- ridge.proj(x, y, betainit = "scaled lasso")
which(fit.ridge.scaled$pval.corr < 0.05)

## Group-wise testing of the first two coefficients
fit.ridge$groupTest(1:2)

## Hierarchical testing using distance matrix based on
## correlation matrix
out.clust <- fit.ridge$clusterGroupTest()
plot(out.clust)

## Fit the method without doing the preparations
## for group testing (saves time and memory)
fit.ridge.faster <- ridge.proj(x, y, suppress.grouptesting = TRUE)



