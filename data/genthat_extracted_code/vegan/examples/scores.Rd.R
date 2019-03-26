library(vegan)


### Name: scores
### Title: Get Species or Site Scores from an Ordination
### Aliases: scores scores.default scores.lda
### Keywords: multivariate

### ** Examples

data(varespec)
vare.pca <- prcomp(varespec)
scores(vare.pca, choices=c(1,2))



