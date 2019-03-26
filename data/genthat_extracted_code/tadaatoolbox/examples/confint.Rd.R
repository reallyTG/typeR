library(tadaatoolbox)


### Name: confint_t
### Title: Confidence Intervals
### Aliases: confint_t confint_norm

### ** Examples

set.seed(42)
df <- data.frame(x = runif(100), y = sample(c("A", "B"), 100, TRUE))
confint_t(df$x)
set.seed(42)
df <- data.frame(x = runif(100), y = sample(c("A", "B"), 100, TRUE))
confint_norm(df$x)



