library(bliss)


### Name: sigmoid
### Title: sigmoid
### Aliases: sigmoid

### ** Examples

## Test 1 :
x <- seq(-7,7,0.1)
y <- sigmoid(x)
plot(x,y,type="l",main="Sigmoid function")
## Test 2 :
x  <- seq(-7,7,0.1)
y  <- sigmoid(x)
y2 <- sigmoid(x,asym=0.5)
y3 <- sigmoid(x,v   =  5)
plot(x,y,type="l",main="Other sigmoid functions")
lines(x,y2,col=2)
lines(x,y3,col=3)



