library(qqplotr)


### Name: stat_qq_point
### Title: Quantile-quantile points
### Aliases: stat_qq_point

### ** Examples

# generate random Normal data
set.seed(0)
smp <- data.frame(norm = rnorm(100))

# Normal Q-Q plot of simulated Normal data
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_qq_point() +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg

# Exponential Q-Q plot of mean ozone levels (airquality dataset)
di <- "exp"
dp <- list(rate = 1)
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
 stat_qq_point(distribution = di, dparams = dp) +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg




