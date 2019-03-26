library(ryouready)


### Name: eta
### Title: Eta coefficient for nominal/interval data.
### Aliases: eta

### ** Examples

attach(d.eta)     # using d.eta dataset
eta(x1, y)

# removing missing data
eta(c(x1, 2), c(NA, y), na.rm=TRUE)   # NA added to y to show NA behaviour

# classify interval data x
eta(x, y, breaks=c(1, 4, 7,10))
# visualize classication
plot(x, y)
abline(v=c(1, 4, 7,10))

# setting number of breaks for classification
eta(x, y, breaks=7)



