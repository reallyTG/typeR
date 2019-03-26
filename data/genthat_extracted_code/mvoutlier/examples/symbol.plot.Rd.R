library(mvoutlier)


### Name: symbol.plot
### Title: Symbol Plot
### Aliases: symbol.plot
### Keywords: dplot

### ** Examples

# create data:
x <- cbind(rnorm(100), rnorm(100))
y <- cbind(rnorm(10, 5, 1), rnorm(10, 5, 1))
z <- rbind(x,y)
# execute:
symbol.plot(z, quan=0.75)



