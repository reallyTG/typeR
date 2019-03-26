library(sprm)


### Name: biplot.prm
### Title: Biplot for prm objects
### Aliases: biplot.prm

### ** Examples

set.seed(5023)
U <- c(rep(3,20), rep(4,30))
X <- replicate(6, U+rnorm(50))
beta <- c(rep(1, 3), rep(-1,3))
e <- c(rnorm(45,0,1.5),rnorm(5,-20,1))
y <- X%*%beta + e
d <- as.data.frame(X)
d$y <- y
mod <- prms(y~., data=d, a=2, fun="Hampel")
biplot(mod, comps = c(1, 2))



