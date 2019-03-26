library(RNAseqNet)


### Name: GLMnetToGraph
### Title: Convert the result of imputedGLMnetwork or a matrix into a
###   network.
### Aliases: GLMnetToGraph

### ** Examples

data(lung)
data(thyroid)
nobs <- nrow(lung)
miss_ind <- sample(1:nobs, round(0.2 * nobs), replace = FALSE)
lung[miss_ind, ] <- NA
lung <- na.omit(lung)
lambdas <- 4 * 10^(seq(0, -2, length = 10))
## Not run: 
##D lung_hdmi <- imputedGLMnetwork(lung, thyroid, sigma = 2, lambdas = lambdas,
##D                                m = 10, B = 5)
##D lung_net <- GLMnetToGraph(lung_hdmi, 0.75)
##D lung_net
##D plot(lung_net)
## End(Not run)




