library(RNAseqNet)


### Name: chooseSigma
### Title: Select the threshold sigma for hd-MI.
### Aliases: chooseSigma

### ** Examples

data(lung)
data(thyroid)
nobs <- nrow(lung)
miss_ind <- sample(1:nobs, round(0.2 * nobs), replace = FALSE)
lung[miss_ind, ] <- NA
lung <- na.omit(lung)
sigma_stats <- chooseSigma(lung, thyroid, 1:5)
## Not run: plot(sigma_stats, type = "b")




