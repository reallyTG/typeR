library(RobLox)


### Name: rowRoblox and colRoblox
### Title: Optimally robust estimation for location and/or scale
### Aliases: rowRoblox colRoblox
### Keywords: robust

### ** Examples

ind <- rbinom(200, size=1, prob=0.05) 
X <- matrix(rnorm(200, mean=ind*3, sd=(1-ind) + ind*9), nrow = 2)
rowRoblox(X)
rowRoblox(X, k = 3)
rowRoblox(X, eps = 0.05)
rowRoblox(X, eps = 0.05, k = 3)

X1 <- t(X)
colRoblox(X1)
colRoblox(X1, k = 3)
colRoblox(X1, eps = 0.05)
colRoblox(X1, eps = 0.05, k = 3)

X2 <- rbind(rnorm(100, mean = -2, sd = 3), rnorm(100, mean = -1, sd = 4))
rowRoblox(X2, sd = c(3, 4))
rowRoblox(X2, eps = 0.03, sd = c(3, 4))
rowRoblox(X2, sd = c(3, 4), k = 4)
rowRoblox(X2, eps = 0.03, sd = c(3, 4), k = 4)

X3 <- cbind(rnorm(100, mean = -2, sd = 3), rnorm(100, mean = 1, sd = 2))
colRoblox(X3, mean = c(-2, 1))
colRoblox(X3, eps = 0.02, mean = c(-2, 1))
colRoblox(X3, mean = c(-2, 1), k = 4)
colRoblox(X3, eps = 0.02, mean = c(-2, 1), k = 4)



