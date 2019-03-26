library(evd)


### Name: clusters
### Title: Identify Clusters of Exceedences
### Aliases: clusters
### Keywords: manip

### ** Examples

clusters(portpirie, 4.2, 3)
clusters(portpirie, 4.2, 3, cmax = TRUE)
clusters(portpirie, 4.2, 3, 3.8, plot = TRUE)
clusters(portpirie, 4.2, 3, 3.8, plot = TRUE, lvals = FALSE)
tvu <- c(rep(4.2, 20), rep(4.1, 25), rep(4.2, 20))
clusters(portpirie, tvu, 3, plot = TRUE)



