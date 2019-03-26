library(NNS)


### Name: NNS.PDF
### Title: NNS PDF
### Aliases: NNS.PDF
### Keywords: CDF PDF, continuous moments, partial

### ** Examples

set.seed(123)
x <- rnorm(100)
NNS.PDF(x)

## Custom target range
NNS.PDF(x, target = c(-5, 5))



