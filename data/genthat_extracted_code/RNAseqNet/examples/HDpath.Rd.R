library(RNAseqNet)


### Name: HDpath
### Title: Methods for 'HDpath' objects.
### Aliases: HDpath summary.HDpath print.HDpath plot.HDpath

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
##D plot(lung_hdmi)
## End(Not run)




