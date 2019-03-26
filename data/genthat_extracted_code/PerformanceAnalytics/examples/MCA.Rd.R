library(PerformanceAnalytics)


### Name: MCA
### Title: Functions for doing Moment Component Analysis (MCA) of financial
###   time series
### Aliases: MCA M3.MCA M4.MCA M4.MCA

### ** Examples

data(edhec)

# coskewness matrix based on two components
M3mca <- M3.MCA(edhec, k = 2)$M3mca

# screeplot MCA 
M3dist <- M4dist <- rep(NA, ncol(edhec))
M3S <- M3.MM(edhec)  # sample coskewness estimator
M4S <- M4.MM(edhec)  # sample cokurtosis estimator
for (k in 1:ncol(edhec)) {
  M3MCA_list <- M3.MCA(edhec, k)
  M4MCA_list <- M4.MCA(edhec, k)

  M3dist[k] <- sqrt(sum((M3S - M3MCA_list$M3mca)^2))
  M4dist[k] <- sqrt(sum((M4S - M4MCA_list$M4mca)^2))
}
par(mfrow = c(2, 1))
plot(1:ncol(edhec), M3dist)
plot(1:ncol(edhec), M4dist)
par(mfrow = c(1, 1))




