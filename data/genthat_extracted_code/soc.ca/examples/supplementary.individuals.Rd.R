library(soc.ca)


### Name: supplementary.individuals
### Title: Add supplementary individuals to a result object
### Aliases: supplementary.individuals

### ** Examples

example(soc.mca)
res.pas   <- soc.mca(active, passive = "Costume")
res.sup   <- supplementary.individuals(res.pas, sup.indicator = indicator(active))
a         <- res.sup$coord.ind[res.sup$supplementary.individuals == "Supplementary",]
b         <- res.pas$coord.ind
all.equal(as.vector(a), as.vector(b))
map.ind(res.sup)



