library(mvoutlier)


### Name: color.plot
### Title: Color Plot
### Aliases: color.plot
### Keywords: dplot

### ** Examples

# create data:
x <- cbind(rnorm(100), rnorm(100))
y <- cbind(rnorm(10, 5, 1), rnorm(10, 5, 1))
z <- rbind(x,y)
# execute:
color.plot(z, quan=0.75)



