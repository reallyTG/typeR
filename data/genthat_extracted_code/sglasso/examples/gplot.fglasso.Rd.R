library(sglasso)


### Name: gplot.fglasso
### Title: Plotting Sparse Factorial Dynamic Gaussian Graphical Model
### Aliases: gplot.fglasso
### Keywords: models

### ** Examples

N <- 50
tp <- 3
p <- 3
X <- matrix(rnorm(N * p * tp), N, tp * p)
S <- crossprod(X) / N
model <- list(lag0 = c(s = "c", n = "ut"), lag1 = c(s = "t", n = "t"))
out.fglasso <- fglasso(S = S, model = model, tp = tp, p = p)
gplot(out.fglasso, rhoid = 50, sub.tp1 = "First graph", 
   sub.tp2 = "Second graph")



