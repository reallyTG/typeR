library(qqplotr)


### Name: stat_pp_band
### Title: Probability-probability confidence bands
### Aliases: stat_pp_band

### ** Examples

# generate random Normal data
set.seed(0)
smp <- data.frame(norm = rnorm(100), exp = rexp(100))

# Normal P-P plot of Normal data
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_pp_band() +
 stat_pp_line() +
 stat_pp_point() +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

# Shifted Normal P-P plot of Normal data
dp <- list(mean = 1.5)
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
 stat_pp_band(dparams = dp) +
 stat_pp_line() +
 stat_pp_point(dparams = dp) +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

# Exponential P-P plot of Exponential data
di <- "exp"
gg <- ggplot(data = smp, mapping = aes(sample = exp)) +
 stat_pp_band(distribution = di) +
 stat_pp_line() +
 stat_pp_point(distribution = di) +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg

# Normal P-P plot of mean ozone levels (airquality dataset)
dp <- list(mean = 38, sd = 27)
gg <- ggplot(data = airquality, mapping = aes(sample = Ozone)) +
 stat_pp_band(dparams = dp) +
 stat_pp_line() +
	stat_pp_point(dparams = dp) +
 labs(x = "Probability Points", y = "Cumulative Probability")
gg




