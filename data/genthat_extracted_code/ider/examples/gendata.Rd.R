library(ider)


### Name: gendata
### Title: Data generator for intrinsic dimension estimation.
### Aliases: gendata

### ** Examples

## global intrinsic dimension estimate
x <- gendata(DataName='SwissRoll')
estmle <- lbmle(x=x,k1=3,k2=5)
print(estmle)

## local intrinsic dimension estimate
tmp <- gendata(DataName='ldbl',n=1000)
x <- tmp$x
estmada <- mada(x=x,local=TRUE)
head(estmada)  ## estimated local intrinsic dimensions
head(tmp$tDim) ## true local intrinsic dimensions



