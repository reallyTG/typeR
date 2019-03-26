library(mvoutlier)


### Name: corr.plot
### Title: Correlation Plot: robust versus classical bivariate correlation
### Aliases: corr.plot
### Keywords: dplot

### ** Examples

# create data:
x <- cbind(rnorm(100), rnorm(100))
y <- cbind(rnorm(10, 3, 1), rnorm(10, 3, 1))
z <- rbind(x,y)
# execute:
corr.plot(z[,1], z[,2])



