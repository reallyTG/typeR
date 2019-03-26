library(RNAseqNet)


### Name: imputeHD
### Title: Impute missing row datasets with multiple hot deck.
### Aliases: imputeHD

### ** Examples

data(lung)
data(thyroid)
nobs <- nrow(lung)
miss_ind <- sample(1:nobs, round(0.2 * nobs), replace = FALSE)
lung[miss_ind, ] <- NA
lung <- na.omit(lung)
imputed_lung <- imputeHD(lung, thyroid, sigma = 2)




