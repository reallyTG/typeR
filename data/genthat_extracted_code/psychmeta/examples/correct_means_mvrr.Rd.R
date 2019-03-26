library(psychmeta)


### Name: correct_means_mvrr
### Title: Multivariate select/correction for vectors of means
### Aliases: correct_means_mvrr

### ** Examples

Sigma <- diag(.5, 4)
Sigma[lower.tri(Sigma)] <- c(.2, .3, .4, .3, .4, .4)
Sigma <- Sigma + t(Sigma)
diag(Sigma) <- 1
correct_means_mvrr(Sigma = Sigma, means_i = c(.3, .3, .1, .1),
means_x_a = c(-.1, -.1), x_col = 1:2)



