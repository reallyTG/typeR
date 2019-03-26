library(SIN)


### Name: sinCG
### Title: SIN for chain graphs
### Aliases: sinCG
### Keywords: multivariate

### ** Examples

data(fowlbones)
p <- dim(fowlbones$corr)[1]
blocks <- list(1:2,3:4,5:6)
sinCG(blocks,fowlbones$corr,fowlbones$n, type="AMP")
sinCG(blocks,fowlbones$corr,fowlbones$n, type="LWF")
sinCG(blocks,fowlbones$corr,fowlbones$n, type="AMP", holm=FALSE)
sinCG(blocks,fowlbones$corr,fowlbones$n, type="LWF", holm=FALSE)



