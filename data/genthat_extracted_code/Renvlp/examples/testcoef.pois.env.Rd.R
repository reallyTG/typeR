library(Renvlp)


### Name: testcoef.pois.env
### Title: Hypothesis test of the coefficients of the envelope model
### Aliases: testcoef.pois.env

### ** Examples

data(horseshoecrab)
X1 <- as.numeric(horseshoecrab[ , 1] == 2)
X2 <- as.numeric(horseshoecrab[ , 1] == 3)
X3 <- as.numeric(horseshoecrab[ , 1] == 4)
X4 <- as.numeric(horseshoecrab[ , 2] == 2)
X5 <- as.numeric(horseshoecrab[ , 2] == 3)
X6 <- horseshoecrab[ , 3]
X7 <- horseshoecrab[ , 5]
X <- cbind(X1, X2, X3, X4, X5, X6, X7)
Y <- horseshoecrab[ , 4]

m <- pois.env(X, Y, 1)

L <- diag(7)
A <- matrix(0, 7, 1)

test.res <- testcoef.pois.env(m, L, A)
test.res



