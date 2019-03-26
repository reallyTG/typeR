library(RNAseqNet)


### Name: stabilitySelection
### Title: Selection of the regularization parameter by StARS (Liu et al.,
###   2010).
### Aliases: stabilitySelection

### ** Examples

data(lung)
lambdas <- 4 * 10^(seq(0, -2, length = 5))
stability_lung <- stabilitySelection(lung, lambdas = lambdas, B = 4)
## Not run: plot(stability_lung)




