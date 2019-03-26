library(mcemGLM)


### Name: simData
### Title: Data used for fitting examples
### Aliases: simData
### Keywords: datasets

### ** Examples

set.seed(47819)
x1 <- rnorm(200, 10, 1)
x2 <- rnorm(200, 5, 1)
x3 <- sample(c("red", "blue", "yellow"), size = 200, replace = TRUE)
z1 <- factor(rep(c("D1", "D2", "D3", "D4", "D5"), each = 40))
z2 <- factor(rep(rep(1:4, each = 5), 10))
z3 <- factor(c(rep("A", 100), rep("B", 60), rep("D", 40)))
kX <- model.matrix(~x1 + x2 + x3)
kZ <- cbind(model.matrix(~ 0+z1), model.matrix(~ 0+z1:z2), model.matrix(~ 0+z3))
kBeta <- c(5, -4, 5, 0, 8)
kU <- 3 * rt(28, 5)
linf0 <- kX 
prob0 <- exp(linf0)/(1+exp(linf0))
obs <- as.numeric(runif(100) < prob0)
simData <- data.frame(obs, x1, x2, x3, z1, z2, z3)



