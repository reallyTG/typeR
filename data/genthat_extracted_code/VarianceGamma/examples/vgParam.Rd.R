library(VarianceGamma)


### Name: vgParam
### Title: Parameter Sets for Variance Gamma Distribution
### Aliases: vgSmallShape vgLargeShape vgSmallParam vgLargeParam

### ** Examples

data(vgParam)
## Testing the accuracy of vgMean
for (i in 1:nrow(vgSmallParam)) {
    param <- vgSmallParam[i,]
    x <- rvg(10000,param = param)
    sampleMean <- mean(x)
    funMean <- vgMean(param = param)
    difference <- abs(sampleMean - funMean)
    print(difference)
}




