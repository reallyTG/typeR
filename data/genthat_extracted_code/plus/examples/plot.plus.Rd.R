library(plus)


### Name: plot.plus
### Title: Plot method for plus objects
### Aliases: plot.plus
### Keywords: hplot methods

### ** Examples

data(sp500)
attach(sp500)

x <- sp500.percent[,3: (dim(sp500.percent)[2])] 
y <- sp500.percent[,1]

object <- plus(x,y,method="mc+")
plot(object)
detach(sp500)



