library(Rlab)


### Name: hplot
### Title: Histogram allowing forced number of bins
### Aliases: hplot
### Keywords: hplot

### ** Examples

# Create and graph some Normal data
set.seed(100)
set.panel(3,1)
z<- rnorm(100)
hplot(z, nclass=5, main="Standard Normal", xlim=c(-10,10), ylim=c(0,.4))
z<- rnorm(100, sd=2)
hplot(z, nclass=10, main="Std Dev of 2", xlim=c(-10,10), ylim=c(0,.4))
z<- rnorm(100, sd=3)
hplot(z, nclass=15, main="Std Dev of 3", xlim=c(-10,10), ylim=c(0,.4))



