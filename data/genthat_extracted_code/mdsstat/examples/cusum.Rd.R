library(mdsstat)


### Name: cusum
### Title: Cumuluative Sum (CUSUM)
### Aliases: cusum cusum.mds_ts cusum.default

### ** Examples

# Basic Example
data <- data.frame(time=c(1:25), event=as.integer(stats::rnorm(25, 100, 25)))
a1 <- cusum(data)
# Example using an mds_ts object
a2 <- cusum(mds_ts[[3]])
# Example using a derived rate as the "event"
data <- mds_ts[[3]]
data$rate <- ifelse(is.na(data$nA), 0, data$nA) / data$exposure
a3 <- cusum(data, c(Rate="rate"))




