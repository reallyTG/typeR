library(POT)


### Name: clust
### Title: Identify Extreme Clusters within a Time Series
### Aliases: clust
### Keywords: manip

### ** Examples

data(ardieres)
par(mfrow=c(1,2))
clust(ardieres, 4, 10 / 365)
clust(ardieres, 4, 10 / 365, clust.max = TRUE)
clust(ardieres, 4, 10 / 365, clust.max = TRUE, plot = TRUE)
##The same but with optional arguments passed to function ``plot''
clust(ardieres, 4, 10 / 365, clust.max = TRUE, plot = TRUE,
xlab = "Time (Years)", ylab = "Flood discharges",
xlim = c(1972, 1980))



