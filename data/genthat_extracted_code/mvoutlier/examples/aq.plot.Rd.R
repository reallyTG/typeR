library(mvoutlier)


### Name: aq.plot
### Title: Adjusted Quantile Plot
### Aliases: aq.plot
### Keywords: dplot

### ** Examples

# create data:
set.seed(134)
x <- cbind(rnorm(80), rnorm(80), rnorm(80))
y <- cbind(rnorm(10, 5, 1), rnorm(10, 5, 1), rnorm(10, 5, 1))
z <- rbind(x,y)
# execute:
aq.plot(z, alpha=0.1)



