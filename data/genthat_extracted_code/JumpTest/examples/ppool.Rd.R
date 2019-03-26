library(JumpTest)


### Name: ppool
### Title: p-values pooling and adjustment
### Aliases: ppool

### ** Examples

orip <- matrix(runif(3000),1000,3)
pvobj <- ppool(orip)
pvalue <- pvobj@pvalue
padjust <- pvobj@adjp



