library(bpca)


### Name: var.rbf
### Title: Projected Correlations by bpca
### Aliases: var.rbf
### Keywords: multivariate

### ** Examples

##
## Particular use
##

bp1 <- bpca(gabriel1971)
bp1$var.rb # NA

# Computes the correlations of all variables under the biplot projection
(res <- var.rbf(bp1$coord$var)) 

##
## Common use
##

bp2 <- bpca(gabriel1971,
            var.rb=TRUE)

bp2$var.rb



