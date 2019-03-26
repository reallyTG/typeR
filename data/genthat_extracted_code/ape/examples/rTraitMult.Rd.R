library(ape)


### Name: rTraitMult
### Title: Multivariate Character Simulation
### Aliases: rTraitMult
### Keywords: datagen

### ** Examples

## correlated evolution of 2 continuous traits:
mod <- function(x, l) {
    y1 <- rnorm(1, x[1] + 0.5*x[2], 0.1)
    y2 <- rnorm(1, 0.5*x[1] + x[2], 0.1)
    c(y1, y2)
}
set.seed(11)
tr <- makeNodeLabel(rcoal(20))
x <- rTraitMult(tr, mod, 2, ancestor = TRUE)
op <- par(mfcol = c(2, 1))
plot(x, type = "n")
text(x, labels = rownames(x), cex = 0.7)
oq <- par(mar = c(0, 1, 0, 1), xpd = TRUE)
plot(tr, font = 1, cex = 0.7)
nodelabels(tr$node.label, cex = 0.7, adj = 1)
par(c(op, oq))



