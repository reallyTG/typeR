library(NNS)


### Name: NNS.caus
### Title: NNS Causation
### Aliases: NNS.caus
### Keywords: causation

### ** Examples

## x clearly causes y...
set.seed(123)
x <- rnorm(100) ; y <- x ^ 2
NNS.caus(x, y, tau = "cs")

x <- 1:100 ; y <- x^2
NNS.caus(x, y, tau = "ts", time.series = TRUE)

## Causal matrix
## Not run: 
##D NNS.caus(data.matrix(iris), tau = 0)
## End(Not run)



