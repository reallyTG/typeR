library(bliss)


### Name: sigmoid_sharp
### Title: sigmoid_sharp
### Aliases: sigmoid_sharp

### ** Examples

## Test 1 :
x <- seq(-7,7,0.1)
y <- sigmoid_sharp(x)
plot(x,y,type="l",main="Sharp sigmoid")
## Test 2 :
x  <- seq(-7,7,0.1)
y  <- sigmoid_sharp(x,loc=3)
y2 <- sigmoid_sharp(x,loc=3,asym=0.5)
y3 <- sigmoid_sharp(x,loc=3,v   =  5)
plot(x,y,type="l",main="Other sharp sigmoids")
lines(x,y2,col=2)
lines(x,y3,col=3)



