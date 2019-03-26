library(cobs)


### Name: exHe
### Title: Small Dataset Example of He
### Aliases: exHe
### Keywords: datasets

### ** Examples

data(exHe)
plot(exHe, main = "He's 10 point example and cobs() fits")
tm <- tapply(exHe$y, exHe$x, mean)
lines(unique(exHe$x), tm, lty = 2)

cH. <- with(exHe,
    cobs(x, y, degree=1, constraint = "increase"))
cH <- with(exHe,
    cobs(x, y, lambda=0.2, degree=1, constraint = "increase"))
plot(exHe)
lines(predict(cH.), type = "o", col="tomato3", pch = "i")# constant
lines(predict(cH), type = "o", col=2, pch = "i")

cHn <- cobs(exHe$x, exHe$y, degree=1, constraint = "none")
lines(predict(cHn), col= 3, type = "o", pch = "n")

cHd <- cobs(exHe$x, exHe$y, degree=1, constraint = "decrease")
lines(predict(cHd), col= 4, type = "o", pch = "d")



