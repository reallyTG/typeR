library(ade4)


### Name: score.mix
### Title: Graphs to Analyse a factor in a Mixed Analysis
### Aliases: score.mix
### Keywords: multivariate hplot

### ** Examples

data(lascaux)
w <- cbind.data.frame(lascaux$colo, lascaux$ornem)
dd <- dudi.mix(w, scan = FALSE, nf = 4, add = TRUE)
score(dd, which = which(dd$cr[,1] > 0.3))



