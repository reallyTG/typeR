library(sizeMat)


### Name: nagelkerkeR2
### Title: Nagelkerme method R-square
### Aliases: nagelkerkeR2

### ** Examples

set.seed(7388)
n <- 300
x <- rnorm(n)
a <- 1
b <- -2
p <- 1/(1+exp(a+b*x))
y <- factor(ifelse(runif(n) < p, 1, 0), levels = 0:1)
mod1 <- glm(y ~ x, family=binomial)
nagelkerkeR2(mod1)



