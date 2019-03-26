library(Compositional)


### Name: MLE of the folded model for a given value of alpha
### Title: MLE of the folded model for a given value of alpha
### Aliases: alpha.mle a.mle
### Keywords: \alpha -transformation maximum likelihood estimation

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
mod <- alfa.tune(x)
mod
alpha.mle(x, mod[1])



