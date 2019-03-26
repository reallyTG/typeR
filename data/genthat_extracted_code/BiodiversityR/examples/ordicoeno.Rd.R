library(BiodiversityR)


### Name: ordicoeno
### Title: Coenoclines for an Ordination Axis
### Aliases: ordicoeno
### Keywords: multivariate

### ** Examples

library(vegan)
library(mgcv)
data(dune)
Ordination.model1 <- rda(dune)
plot1 <- ordiplot(Ordination.model1, choices=c(1,2), scaling=1)
ordicoeno(dune, ordiplot=plot1, legend=TRUE)



