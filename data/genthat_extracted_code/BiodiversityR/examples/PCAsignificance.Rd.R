library(BiodiversityR)


### Name: PCAsignificance
### Title: PCA Significance
### Aliases: PCAsignificance ordiequilibriumcircle
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune)
Ordination.model1 <- rda(dune)
PCAsignificance(Ordination.model1)
plot1 <- ordiplot(Ordination.model1, choices=c(1,2), scaling=1)
ordiequilibriumcircle(Ordination.model1,plot1)



