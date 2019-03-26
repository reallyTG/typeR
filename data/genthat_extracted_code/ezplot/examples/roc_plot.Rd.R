library(ezplot)


### Name: roc_plot
### Title: roc_plot
### Aliases: roc_plot

### ** Examples

library(ggplot2)
n = 10000
df = data.frame(actual = sample(c(FALSE, TRUE), n, replace = TRUE),
                runif = runif(n))
df[["fitted"]] = runif(n) ^ ifelse(df[["actual"]] == 1, 0.5, 2)

ggplot(df) +
  geom_density(aes(fitted, fill = actual), alpha = 0.5)

roc_plot(df, "actual", "actual")
roc_plot(df, "actual", "fitted")
roc_plot(df, "actual", "runif")

## No test: 
roc_plot(df, "actual", "fitted", "sample(c(1, 2), n(), TRUE)")

roc_plot(df, "actual", "fitted",
         "sample(c(1, 2), n(), TRUE)",
         "sample(c(3, 4), n(), TRUE)")

roc_plot(df, "actual", "fitted",
         "sample(c(1, 2), n(), TRUE)",
         "sample(c(3, 4), n(), TRUE)",
         "sample(c(5, 6), n(), TRUE)")
## End(No test)



