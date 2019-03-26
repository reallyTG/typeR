library(acid)


### Name: sgini
### Title: Single-parameter Gini Coefficient
### Aliases: sgini

### ** Examples

set.seed(123)
x <- rnorm(100,10,1)
gini(x)$Gini
sgini(x,nu=2)$Gini



