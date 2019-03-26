library(ecodist)


### Name: corgen
### Title: Generate correlated data
### Aliases: corgen
### Keywords: distribution

### ** Examples


# create two random variables of length 100 with correlation
# of 0.10 +/- 0.01
xy <- corgen(len=100, r=.1, epsilon=0.01)
with(xy, cor(x, y))

# create two random variables of length 100 drawn from a population with
# a correlation of -0.82
xy <- corgen(len=100, r=-0.82, population=TRUE)
with(xy, cor(x, y))

# create a variable y within 0.01 of the given correlation to x
x <- 1:100
y <- corgen(x=x, r=.5, epsilon=.01)$y
cor(x, y)



