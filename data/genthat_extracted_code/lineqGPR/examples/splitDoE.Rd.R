library(lineqGPR)


### Name: splitDoE
### Title: Training/test data generator according to a given Design of
###   Experiment (DoE)
### Aliases: splitDoE

### ** Examples

# generating the toy example
x <- seq(0, 1, length = 100)
y <- sin(4*pi*x)

# regular DoE
DoE <- splitDoE(x, y, DoE.type = "regs", ratio = 0.3)
plot(x,y)
points(DoE$xdesign, DoE$ydesign, col = "red", pch = 20)
points(DoE$xtest, DoE$ytest, col = "blue", pch = 20)
legend("topright", c("training data", "test data"),
       pch = rep(20, 2), col = c("red", "blue"))

# random DoE
DoE <- splitDoE(x, y, DoE.type = "rand", ratio = 0.3, seed = 1)
plot(x,y)
points(DoE$xdesign, DoE$ydesign, col = "red", pch = 20)
points(DoE$xtest, DoE$ytest, col = "blue", pch = 20)
legend("topright", c("training data", "test data"),
       pch = rep(20, 2), col = c("red", "blue"))




