library(bspec)


### Name: quantile.bspec
### Title: Quantiles of the posterior spectrum
### Aliases: quantile.bspec
### Keywords: ts

### ** Examples

lhspec <- bspec(lh)

# posterior medians:
print(cbind("frequency"=lhspec$freq,
            "median"=quantile(lhspec, 0.5)))



