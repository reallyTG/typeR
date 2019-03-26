## ------------------------------------------------------------------------
set.seed(0)
library(TestFunctions)
branin(runif(2))
branin(matrix(runif(20), ncol=2))

## ------------------------------------------------------------------------
ContourFunctions::cf(banana)

## ---- fig.show='hold'----------------------------------------------------
tf1 <- function(xx) powsin(x=matrix(xx,ncol=1),  noise=0)
curve(tf1, main="Function without noise")


x1 <- runif(1e2)
y1 <- powsin(x=matrix(x1,ncol=1),  noise=.1)
plot(x1,y1, col=2, pch=19, cex=.3, main="Data with noise")
curve(tf1,add=T)

## ------------------------------------------------------------------------
tf <- RFF_get(D=1)
curve(tf)

## ------------------------------------------------------------------------
ContourFunctions::cf(RFF_get(D=2))

## ------------------------------------------------------------------------
ContourFunctions::cf(banana)
ContourFunctions::cf(add_zoom(banana, c(0,.5), c(1,1)))
ContourFunctions::cf(add_zoom(banana, c(.2,.5), c(.8,1)))

