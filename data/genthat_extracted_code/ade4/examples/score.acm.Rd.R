library(ade4)


### Name: score.acm
### Title: Graphs to study one factor in a Multiple Correspondence Analysis
### Aliases: score.acm
### Keywords: multivariate hplot

### ** Examples

data(banque)
banque.acm <- dudi.acm(banque, scann = FALSE, nf = 3)
score(banque.acm, which = which(banque.acm$cr[, 1] > 0.2))



