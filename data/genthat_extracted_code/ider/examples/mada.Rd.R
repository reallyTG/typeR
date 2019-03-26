library(ider)


### Name: mada
### Title: Manifold-Adaptive Local Dimension Estimation.
### Aliases: mada

### ** Examples

## local intrinsic dimension estimate
tmp <- gendata(DataName='ldbl',n=300)
x <- tmp$x
estmada <- mada(x=x,local=TRUE)
head(estmada)  ## estimated local intrinsic dimensions by mada
head(tmp$tDim) ## true local intrinsic dimensions



