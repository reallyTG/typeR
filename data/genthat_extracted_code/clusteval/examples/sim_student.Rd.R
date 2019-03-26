library(clusteval)


### Name: sim_student
### Title: Generates random variates from multivariate Student's t
###   populations.
### Aliases: sim_student

### ** Examples

data_generated <- sim_student(n = 10 * seq_len(5), seed = 42)
dim(data_generated$x)
table(data_generated$y)

data_generated2 <- sim_student(p = 10, delta = 2, df = rep(2, 5))
table(data_generated2$y)
sample_means <- with(data_generated2,
                     tapply(seq_along(y), y, function(i) {
                            colMeans(x[i,])
                     }))
(sample_means <- do.call(rbind, sample_means))



