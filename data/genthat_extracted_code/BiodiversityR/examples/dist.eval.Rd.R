library(BiodiversityR)


### Name: dist.eval
### Title: Distance Matrix Evaluation
### Aliases: dist.eval prepare.bioenv
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune)
dist.eval(dune,"euclidean")
dist.eval(dune,"bray")

## Not run: 
##D data(dune.env)
##D dune.env2 <- dune.env[,c('A1', 'Moisture', 'Manure')]
##D dune.env2$Moisture <- as.numeric(dune.env2$Moisture)
##D dune.env2$Manure <- as.numeric(dune.env2$Manure)
##D sol <- bioenv(dune ~ A1 + Moisture + Manure, dune.env2)
##D sol
##D summary(sol)
##D dune.env3 <- prepare.bioenv(dune.env, as.numeric=c('Moisture', 'Manure'))
##D bioenv(dune, dune.env3)
## End(Not run)





