library(birk)


### Name: summ_stat
### Title: Pooled Summary Descriptive Statistics
### Aliases: summ_stat

### ** Examples

summ_stat(mean = c(0.68, 0.67), n = c(4, 5), sd = c(0.11, 0.15))
summ_stat(mean = 0.68, n = 3, se = 5)
summ_stat(mean = rnorm(1e4), n = rep(1, 1e4)) # Find pooled mean when variability is unknown.




