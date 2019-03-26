library(sortinghat)


### Name: simdata_uniform
### Title: Generates random variates from multivariate uniform populations.
### Aliases: simdata_uniform

### ** Examples

data_generated <- simdata_uniform(seed = 42)
dim(data_generated$x)
table(data_generated$y)

data_generated2 <- simdata_uniform(n = 10 * seq_len(5), delta = 1.5)
table(data_generated2$y)
sample_means <- with(data_generated2,
                     tapply(seq_along(y), y, function(i) {
                            colMeans(x[i,])
                     }))
(sample_means <- do.call(rbind, sample_means))



