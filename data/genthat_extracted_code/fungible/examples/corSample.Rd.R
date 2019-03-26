library(fungible)


### Name: corSample
### Title: Sample Correlation Matrices from a Population Correlation Matrix
### Aliases: corSample
### Keywords: datagen

### ** Examples

R <- matrix(c(1, .5, .5, 1), 2, 2)
# generate a sample correlation from pop R with n = 25
out <- corSample(R, n = 25)
out$cor.sample
out$cov.sample



