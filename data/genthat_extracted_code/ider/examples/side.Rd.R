library(ider)


### Name: side
### Title: Higher-order Local Information Dimension Estimator.
### Aliases: side

### ** Examples

## local intrinsic dimension estimate
tmp <- gendata(DataName='ldbl', n=300)
x <- tmp$x
set.seed(999)
idx <- c(sample(which(tmp$tDim==1)[1:10],3), sample(which(tmp$tDim==2)[1:30],3))
estmada <- mada(x=x[1:100,], local=TRUE)
estmada[idx]  ## estimated local intrinsic dimensions by mada
tmp$tDim[idx] ## true local intrinsic dimensions
estside <- side(x=x[1:100,], local=TRUE)
estside[idx] ## estimated local intrinsic dimensions by side



