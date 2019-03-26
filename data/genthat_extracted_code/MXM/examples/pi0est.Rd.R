library(MXM)


### Name: Estimation of the percentage of Null p-values
### Title: Estimation of the percentage of Null p-values
### Aliases: pi0est

### ** Examples

## simulate a dataset with continuous data
y <- rdag2(500, p = 25, nei = 3)
ind <- sample(1:25, 25)
x <- y$x[, ind]
mod <- pc.skel( x, method = "comb.fast", alpha = 0.01 ) 
pval <- exp(mod$pvalue)
pval <- lower.tri(pval)
pi0est(pval)



