library(seismicRoll)


### Name: findOutliers
### Title: Outlier Detection with a Rolling Hampel Filter
### Aliases: findOutliers

### ** Examples

# Noisy sinusoid with outliers
a <- jitter(sin(0.1*seq(1e4)),amount=0.2)
indices <- sample(seq(1e4),20)
a[indices] <- a[indices]*10

# Outlier detection should identify many of these altered indices
sort(indices)
findOutliers(a)



