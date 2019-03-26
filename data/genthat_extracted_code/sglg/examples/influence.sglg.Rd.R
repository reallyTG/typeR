library(sglg)


### Name: influence.sglg
### Title: influence
### Aliases: influence.sglg

### ** Examples

rows <- 100
columns <- 2
t_beta  <- c(0.5, 2)
t_sigma <- 1
t_lambda <- 1
set.seed(8142031)
x1 <- rbinom(rows, 1, 0.5)
x2 <- runif(columns, 0, 1)
X <- cbind(x1,x2)
error <- robustloggamma::rloggamma(rows, 0, 1, t_lambda)
y1 <- X %*%t_beta + t_sigma * error
data.example <- data.frame(y1,X)
fit1 <- glg(y1 ~ x1 + x2 - 1,data=data.example)
influence(fit1)



