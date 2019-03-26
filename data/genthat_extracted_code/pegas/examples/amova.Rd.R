library(pegas)


### Name: amova
### Title: Analysis of Molecular Variance
### Aliases: amova print.amova getPhi write.pegas.amova
### Keywords: models

### ** Examples

### All examples below have 'nperm = 100' for faster execution times.
### The default 'nperm = 1000' is recommended.
require(ape)
data(woodmouse)
d <- dist.dna(woodmouse)
g <- factor(c(rep("A", 7), rep("B", 8)))
p <- factor(c(rep(1, 3), rep(2, 4), rep(3, 4), rep(4, 4)))
(d_gp <- amova(d ~ g/p, nperm = 100)) # 2 levels
sig2 <- setNames(d_gp$varcomp$sigma2, rownames(d_gp$varcomp))
getPhi(sig2) # Phi table
amova(d ~ p, nperm = 100) # 1 level
amova(d ~ g, nperm = 100)

## 3 levels (quite slow):
## Not run: 
##D pop <- gl(64, 5, labels = paste0("pop", 1:64))
##D region <- gl(16, 20, labels = paste0("region", 1:16))
##D conti <- gl(4, 80, labels = paste0("conti", 1:4))
##D dd <- as.dist(matrix(runif(320^2), 320))
##D (dd_crp <- amova(dd ~ conti/region/pop, nperm = 100))
##D sig2 <- setNames(dd_crp$varcomp$sigma2, rownames(dd_crp$varcomp))
##D getPhi(sig2)
## End(Not run)


