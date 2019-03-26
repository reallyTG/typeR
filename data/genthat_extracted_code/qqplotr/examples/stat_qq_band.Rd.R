library(qqplotr)


### Name: geom_qq_band
### Title: Quantile-quantile confidence bands
### Aliases: geom_qq_band stat_qq_band

### ** Examples

# generate random Normal data
set.seed(0)
smp <- data.frame(norm = rnorm(100))

# Normal Q-Q plot of Normal data
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_qq_band() +
 stat_qq_line() +
 stat_qq_point()
gg + labs(x = "Theoretical Quantiles", y = "Sample Quantiles")

# Exponential Q-Q plot of mean ozone levels (airquality dataset)
di <- "exp"
dp <- list(rate = 1)
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
 stat_qq_band(distribution = di, dparams = dp) +
 stat_qq_line(distribution = di, dparams = dp) +
 stat_qq_point(distribution = di, dparams = dp) +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg

# Detrended Exponential Q-Q plot of mean ozone levels
di <- "exp"
dp <- list(rate = 1)
de <- TRUE
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
 stat_qq_band(distribution = di, detrend = de) +
 stat_qq_line(distribution = di, detrend = de) +
 stat_qq_point(distribution = di, detrend = de) +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg

# Normal Q-Q plot of Normal data with boostrap confidence bands
bt <- "boot"
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_qq_band(bandType = bt) +
 stat_qq_line() +
 stat_qq_point() +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg

# Normal Q-Q plot of Normal data with tail-sensitive confidence bands
bt <- "ts"
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_qq_band(bandType = bt) +
 stat_qq_line() +
 stat_qq_point() +
 labs(x = "Theoretical Quantiles", y = "Sample Quantiles")
gg




