library(MXM)


### Name: Fit a mixture of beta distributions in p-values
### Title: Fit a mixture of beta distributions in p-values
### Aliases: pval.mixbeta

### ** Examples

## simulate a dataset with continuous data
y <- rdag2(500, p = 25, nei = 3)
ind <- sample(1:25, 25)
x <- y$x[, ind]
mod <- pc.skel( x, method = "comb.fast", alpha = 0.01 ) 
pval <- as.vector( mod$pvalue[lower.tri(mod$pvalue)] )
pval.mixbeta(pval)



