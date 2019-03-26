library(fanovaGraph)


### Name: kmAdditive
### Title: Constrained MLE Optimization
### Aliases: kmAdditive

### ** Examples

### example for ishigami function with cliques {1,3} and {2}
d <- 3
x <- matrix(runif(100*d,-pi,pi),nc=d)
y <- ishigami.fun(x)

cl <- list(c(2), c(1,3))

# constrained ML optimation with kernel defined by the cliques
parameter <- kmAdditive(x, y, cl = cl)

# prediction with the new model
xpred <- matrix(runif(500 * d,-pi,pi), ncol = d)
ypred <- predictAdditive(xpred, x, y, parameter, cl=cl)
yexact <- ishigami.fun(xpred)

# rmse
sqrt(mean((ypred[,1]- yexact)^2))

# scatterplot
par(mfrow=c(1,1))
plot(yexact, ypred[,1], asp = 1)
abline(0, 1)

### compare to one single clique {1,2,3}
cl <- list(c(1,2,3))

# constrained ML optimation with kernel defined by the cliques
parameter <- kmAdditive(x, y, cl = cl)

# prediction with the new model
ypred <- predictAdditive(xpred, x, y, parameter, cl=cl)

# rmse
sqrt(mean((ypred$mean- yexact)^2))

# scatterplot
par(mfrow=c(1,1))
plot(yexact, ypred$mean, asp = 1)
abline(0, 1)

### isotropic cliques

cl <- list(c(2),c(1,3))
parameter <- kmAdditive(x, y, cl = cl, iso=c(FALSE,TRUE))
ypred <- predictAdditive(xpred, x, y, parameter, cl=cl, iso=c(FALSE,TRUE))
sqrt(mean((ypred$mean- yexact)^2))

# the same since first clique has length 1
parameter <- kmAdditive(x, y, cl = cl, iso=c(TRUE,TRUE))
ypred <- predictAdditive(xpred, x, y, parameter, cl=cl, iso=c(TRUE,TRUE))
sqrt(mean((ypred$mean- yexact)^2))



