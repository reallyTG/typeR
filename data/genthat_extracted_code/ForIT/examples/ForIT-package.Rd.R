library(ForIT)


### Name: ForIT-package
### Title: Functions for Italian Tree species Volume and Biomass
### Aliases: ForIT ForIT-package
### Keywords: package

### ** Examples

# one single tree
INFCvpe('Acca', 22, 14, mod='v', freq=2, aggr=FALSE)

# a list with ten trees of the same specie
INFCvpe(rep('Acca',10),d=c(10,15,20,30,32,24,36,40,8,18),
    h=c(7,9,12,20,21,18,21,22,8,12), mod='v', aggr=TRUE)

# a list of different species
species <- rep(c('Abal','Piab'),2)
dbh <- c(10,41,20,30)
heigths <- c(12,14,13,15)
frequences <- c(2,6,5,4)
data.frame(species, dbh, heigths, frequences)

# single-tree estimates
INFCvpe(species, dbh, heigths, mod='v', frequences, aggr=FALSE)

# estimates aggregated at species level
INFCvpe(species, dbh, heigths, mod='v', frequences, aggr=TRUE)



