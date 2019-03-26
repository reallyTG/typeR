library(mdsstat)


### Name: poisson_rare
### Title: Poisson for Rare Events
### Aliases: poisson_rare poisson_rare.mds_ts poisson_rare.default

### ** Examples

# Basic Example
data <- data.frame(time=c(1:8), event=c(rep(0, 6), stats::rpois(2, 4)))
a1 <- poisson_rare(data)
# Example using an mds_ts object
a2 <- poisson_rare(mds_ts[[1]])
# Example using a derived rate as the "event"
data <- mds_ts[[1]]
data$rate <- ifelse(is.na(data$nA), 0, data$nA) / data$exposure
a3 <- poisson_rare(data, c("Rate"="rate"))



