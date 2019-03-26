library(md)


### Name: md
### Title: md selects bandwidth for kernel density estimator with minimum
###   distance method. Minimum distance method directly selects optimal
###   kernel density estimator in countably infinite kernel density
###   estimators and indirectly selects optimal bandwidth. md selects
###   optimal bandwidth in countably finite kernel density estimators.
### Aliases: md

### ** Examples

# select bandwidth
md(runif(100),20,0.6)

# select bandwidth and plot
data <- rnorm(100)
bandwidth <- md(data,20,0.6)
x <- seq(min(data),max(data),length=100)
plot(x,sapply(x,fhat,bandwidth,data),type="l",ylab="density")



