## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
library(ICtest)
set.seed(1)
n <- 1500
S <- cbind(runif(n), rchisq(n, 2), rexp(n), rnorm(n), rnorm(n), rnorm(n))
A <- matrix(rnorm(36), ncol = 6)
X <- S  %*% t(A)

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
FOBI1 <- FOBIasymp(X, k = 3, model="ICA")
screeplot(FOBI1)
abline(h = 8) # p=6, i.e. p + 2 = 8

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
FOBI1 

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
FOBIasymp(X, k = 3, type = "S1", model = "ICA")
FOBIasymp(X, k = 3, type = "S2", model = "ICA")

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
FOBIasymp(X, k = 2)

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
FOBIboot(X, k = 3, s.boot = "B1")
FOBIboot(X, k = 3, s.boot = "B2")

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
library(ICtest)
X <- as.matrix(iris[, 1:4])

res1 <- NGPP(X, k = 2)
plot(res1$S, col = as.factor(iris[, 5]), xlab = "signal_1", ylab = "signal_2")

res2 <- NGPP(X, k = 2, nl=c("tanh", "pow3"), alpha = c(0.5, 0.5))
plot(res2$S, col = as.factor(iris[, 5]), xlab = "signal_1", ylab = "signal_2")

## ---- message = FALSE, warning = FALSE-----------------------------------
set.seed(2016)
S <- cbind(rexp(100), rnorm(100), rnorm(100))
A <- matrix(rnorm(9), 3, 3)
X <- S%*%A
res0 <- NGPPsim(X, k = 0, N = 200)
res0$p.value
res1 <- NGPPsim(X, k = 1, N = 200)
res1$p.value

## ---- message = FALSE, warning = FALSE-----------------------------------
set.seed(2016)
S <- cbind(rexp(100), runif(100), rnorm(100))
A <- matrix(rnorm(9), 3, 3)
X <- S%*%A
res <- NGPPest(X, nl = "pow3", N = 200)
res$p.value

