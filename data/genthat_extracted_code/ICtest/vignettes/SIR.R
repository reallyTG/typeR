## ---- fig.show = "hold", fig.width = 7, fig.height = 7-------------------
set.seed(1234)
n <- 200
p <- 10
X <- matrix(rnorm(p*n), ncol = p)
eps <- rnorm(n, sd=0.25)
y <- X[, 1]/ (0.5+(X[, 2]+1.5)^2)
pairs(cbind(y,X))

## ---- message = FALSE, warning = FALSE, fig.show = "hold", fig.width = 7, fig.height = 7----
library(ICtest)
SIRasympk2 <- SIRasymp(X,y,2)
screeplot(SIRasympk2)
SIRasympk2

## ---- message = FALSE, warning = FALSE, fig.show = "hold"----------------
SIRbootk2 <- SIRboot(X,y,2)
SIRbootk2

## ---- fig.show = "hold", fig.width = 7, fig.height = 7-------------------
pairs(cbind(y, components(SIRbootk2, which="k")))

