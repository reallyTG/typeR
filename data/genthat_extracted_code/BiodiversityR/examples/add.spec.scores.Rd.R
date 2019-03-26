library(BiodiversityR)


### Name: add.spec.scores
### Title: Add Species Scores to Unconstrained Ordination Results
### Aliases: add.spec.scores
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune)
distmatrix <-vegdist(dune, method="euc")
# Principal coordinates analysis with 19 axes to estimate total variance
Ordination.model1 <- cmdscale (distmatrix, k=19, eig=TRUE, add=FALSE)
# Change scores for second axis
Ordination.model1$points[,2] <- -1.0 * Ordination.model1$points[,2]
Ordination.model1 <- add.spec.scores(Ordination.model1, dune, 
    method='pcoa.scores', Rscale=TRUE, scaling=1, multi=1)
# Compare Ordination.model1 with PCA
Ordination.model2 <- rda(dune, scale=FALSE)
#
par(mfrow=c(1,2))
ordiplot(Ordination.model1, type="text")
abline(h = 0, lty = 3)
abline(v = 0, lty = 3)
plot(Ordination.model2, type="text", scaling=1)



