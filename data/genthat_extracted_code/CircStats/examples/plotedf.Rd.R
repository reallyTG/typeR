library(CircStats)


### Name: plotedf
### Title: Plot Empirical Distribution Function
### Aliases: plotedf
### Keywords: hplot

### ** Examples

# Compare the edf's of two simulated sets of data.
data1 <- rvm(10, 0, 3)
data2 <- rvm(10, 0, 1)
plotedf(data1, xlab="Data", ylab="EDF", main="Plots of Two EDF's")
par(new=TRUE)
plotedf(data2, axes=FALSE, xlab="", ylab="", lty=2)



