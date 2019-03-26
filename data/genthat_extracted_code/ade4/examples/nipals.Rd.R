library(ade4)


### Name: nipals
### Title: Non-linear Iterative Partial Least Squares (NIPALS) algorithm
### Aliases: nipals print.nipals scatter.nipals
### Keywords: multivariate

### ** Examples

data(doubs)
## nipals is equivalent to dudi.pca when there are no NA
acp1 <- dudi.pca(doubs$env, scannf = FALSE, nf = 2)
nip1 <- nipals(doubs$env)


if(adegraphicsLoaded()) {
  if(requireNamespace("lattice", quietly = TRUE)) {
    g1 <- s1d.barchart(acp1$eig, psub.text = "dudi.pca", p1d.horizontal = FALSE, plot = FALSE)
    g2 <- s1d.barchart(nip1$eig, psub.text = "nipals", p1d.horizontal = FALSE, plot = FALSE)
    g3 <- lattice::xyplot(nip1$c1[, 1] ~ acp1$c1[, 1], main = "col scores", xlab = "dudi.pca", 
      ylab = "nipals")
    g4 <- lattice::xyplot(nip1$li[, 1] ~ acp1$li[, 1], main = "row scores", xlab = "dudi.pca", 
      ylab = "nipals")
    G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  }
  
} else {
  par(mfrow = c(2, 2))
  barplot(acp1$eig, main = "dudi.pca")
  barplot(nip1$eig, main = "nipals")
  plot(acp1$c1[, 1], nip1$c1[, 1], main = "col scores", xlab = "dudi.pca", ylab = "nipals")
  plot(acp1$li[, 1], nip1$li[, 1], main = "row scores", xlab = "dudi.pca", ylab = "nipals")
}

## Not run: 
##D ## with NAs:
##D doubs$env[1, 1] <- NA
##D nip2 <- nipals(doubs$env)
##D cor(nip1$li, nip2$li)
##D nip1$eig
##D nip2$eig
## End(Not run)


