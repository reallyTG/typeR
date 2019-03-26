library(plus)


### Name: print.plus
### Title: Print plus() steps when predictors are added or removed.
### Aliases: print.plus
### Keywords: print methods

### ** Examples

data(sp500)
attach(sp500)

x <- sp500.percent[,3: (dim(sp500.percent)[2])] 
y <- sp500.percent[,1]

object <- plus(x,y,method="mc+")
print(object, print.moves=30)
detach(sp500)



