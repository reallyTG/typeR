library(tadaatoolbox)


### Name: mean_ci_t
### Title: Get mean and CI for a numeric vector
### Aliases: mean_ci_t

### ** Examples

set.seed(42)
df <- data.frame(x = runif(100), y = sample(c("A", "B"), 100, TRUE))
mean_ci_t(df$x)



