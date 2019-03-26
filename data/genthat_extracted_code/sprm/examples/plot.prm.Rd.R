library(sprm)


### Name: plot.prm
### Title: Plots for prm objects
### Aliases: plot.prm

### ** Examples

set.seed(5023)
U <- c(rep(2,20), rep(5,30))
X <- replicate(6, U+rnorm(50))
beta <- c(rep(1, 3), rep(-1,3))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X%*%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")

plot.prm(mod, type="yyp", errorbar_width=0.001)
plot(mod, type="coefficients", 
colors = list(bars = "darkgreen", errorbars = "red", background = "lightgray"))
plot(mod, type="weights")



