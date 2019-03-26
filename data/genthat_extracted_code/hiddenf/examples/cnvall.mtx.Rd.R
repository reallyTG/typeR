library(hiddenf)


### Name: cnvall.mtx
### Title: Copy Number Variation
### Aliases: cnvall.mtx
### Keywords: datasets

### ** Examples

data(cnvall.mtx)
cnvall.mtx
cnv3.mtx <- matrix(cnvall.mtx[25:36,3],byrow=TRUE,nrow=12,ncol=2)
cnv3.out <- HiddenF(cnv3.mtx)
print(cnv3.out$pvalue)
anova(cnv3.out)



