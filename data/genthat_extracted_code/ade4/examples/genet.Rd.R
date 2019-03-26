library(ade4)


### Name: genet
### Title: A class of data: tables of populations and alleles
### Aliases: genet char2genet count2genet freq2genet
### Keywords: multivariate

### ** Examples

data(casitas)
casitas[24,]
casitas.pop <- as.factor(rep(c("dome", "cast", "musc", "casi"), c(24,11,9,30)))
casi.genet <- char2genet(casitas, casitas.pop, complete=TRUE)
names(casi.genet$tab) 
casi.genet$tab[,1:8] 
casi.genet$pop.names
casi.genet$loc.names
casi.genet$all.names
casi.genet$loc.blocks # number of allelic forms by loci
casi.genet$loc.fac # factor classifying the allelic forms by locus
casi.genet$pop.loc # table populations loci
names(casi.genet$comp)
casi.genet$comp[1:4,]
casi.genet$comp.pop
casi.genet$center
apply(casi.genet$tab,2,mean)
casi.genet$pop.loc[,"L15"]
casi.genet$tab[, c("L15.1","L15.2")]
class(casi.genet)
casitas.coa <- dudi.coa(casi.genet$comp, scannf = FALSE)
s.class(casitas.coa$li,casi.genet$comp.pop)



