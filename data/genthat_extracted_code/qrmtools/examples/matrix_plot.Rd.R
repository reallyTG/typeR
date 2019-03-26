library(qrmtools)


### Name: matrix_plot
### Title: Graphical Tool for Visualizing Matrices
### Aliases: matrix_plot
### Keywords: hplot

### ** Examples

## Generate a random correlation matrix
d <- 50
L <- diag(1:d)
set.seed(271)
L[lower.tri(L)] <- runif(choose(d,2)) # random Cholesky factor
Sigma <- L 
P <- cor(Sigma)

## Default
matrix_plot(P)
matrix_plot(abs(P)) # if nonnegative
L. <- L
diag(L.) <- NA
matrix_plot(L.) # Cholesky factor without diagonal

## Default if nonpositive
matrix_plot(-abs(P))

## Extending the color key to [-1,1] with darker color for |rho| >> 0
## Note: When specifying 'at', one most likely also wants 'col.regions'
matrix_plot(P, at = seq(-1, 1, length.out = 200),
            col.regions = grey(c(seq(0, 1, length.out = 100), seq(1, 0,
                                     length.out = 100))))

## An example with overlaid lines
library(lattice)
my_panel <- function(...) {
    panel.levelplot(...)
    panel.abline(h = c(10, 20), v = c(10, 20), lty = 2)
}
matrix_plot(P, panel = my_panel)



