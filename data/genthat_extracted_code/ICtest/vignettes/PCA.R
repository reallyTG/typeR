## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
library(ICtest)
set.seed(1)
n <- 200
S <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))
A <- rorth(5)
X <- S  %*% t(A)
pairs(X)

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
PCAcov <- PCAasymp(X, k=2)
PCAcov
PCAtyler <- PCAasymp(X, k=2, scatter = "tyler")
PCAtyler
ggscreeplot(PCAtyler)

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
PCAcov0 <- PCAasymp(X, k=0)
PCAcov0

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
PCAtMk1 <- PCAboot(X, k=1, S="tM", Sargs=list(df=2))
PCAtMk1
PCAtMk2 <- PCAboot(X, k=2, S="tM", Sargs=list(df=2))
PCAtMk2
ggplot(PCAtMk2, which="k")

