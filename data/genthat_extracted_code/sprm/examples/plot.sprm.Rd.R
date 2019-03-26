library(sprm)


### Name: plot.sprm
### Title: Plots for sprm objects
### Aliases: plot.sprm

### ** Examples

set.seed(5023)
U1 <- c(rep(2,20), rep(5,30))
U2 <- rep(3.5,50)
X1 <- replicate(5, U1+rnorm(50))
X2 <- replicate(20, U2+rnorm(50))
X <- cbind(X1,X2)
beta <- c(rep(1, 5), rep(0,20))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X%*%beta + e
d <- as.data.frame(X)
d$y <- y
smod <- sprms(y~., data=d, a=1, eta=0.5, fun="Hampel")
mod <- prms(y~., data=d, a=1, fun="Hampel")

plot(smod, type="yyp", errorbar_width=0.001)

plot(smod, type="coefficients")
plot(mod, type="coefficients")

plot(smod, type="weights")

plot(smod, type="dd", colors=list(background="lightgray", scores="darkblue", cutoffs="red"))



