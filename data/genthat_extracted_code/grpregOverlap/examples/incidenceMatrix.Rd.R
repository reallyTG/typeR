library(grpregOverlap)


### Name: incidenceMatrix
### Title: Compute the incidence matrix indicating group memebership
### Aliases: incidenceMatrix

### ** Examples

data(pathway.dat)
X <- pathway.dat$expression
group <- pathway.dat$pathways
incidence.mat <- incidenceMatrix(X, group)
dim(incidence.mat)



