library(clusteval)


### Name: sim_unif
### Title: Generates random variates from five multivariate uniform
###   populations.
### Aliases: sim_unif

### ** Examples

data_generated <- sim_unif(seed = 42)
dim(data_generated$x)
table(data_generated$y)

data_generated2 <- sim_unif(n = 10 * seq_len(5), delta = 1.5)
table(data_generated2$y)
sample_means <- with(data_generated2,
                     tapply(seq_along(y), y, function(i) {
                            colMeans(x[i,])
                     }))
(sample_means <- do.call(rbind, sample_means))



