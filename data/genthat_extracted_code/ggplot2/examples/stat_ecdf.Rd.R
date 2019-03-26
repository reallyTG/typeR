library(ggplot2)


### Name: stat_ecdf
### Title: Compute empirical cumulative distribution
### Aliases: stat_ecdf

### ** Examples

df <- data.frame(
  x = c(rnorm(100, 0, 3), rnorm(100, 0, 10)),
  g = gl(2, 100)
)
ggplot(df, aes(x)) + stat_ecdf(geom = "step")

# Don't go to positive/negative infinity
ggplot(df, aes(x)) + stat_ecdf(geom = "step", pad = FALSE)

# Multiple ECDFs
ggplot(df, aes(x, colour = g)) + stat_ecdf()



