library(RNAseqNet)


### Name: GLMnetwork
### Title: Infer a network from RNA-seq expression.
### Aliases: GLMnetwork

### ** Examples

data(lung)
lambdas <- 4 * 10^(seq(0, -2, length = 10))
ref_lung <- GLMnetwork(lung, lambdas = lambdas)




