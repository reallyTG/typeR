library(QTLRel)


### Name: genoSim
### Title: Generate Genotypic Data
### Aliases: genoSim

### ** Examples

data(miscEx)

## Not run: 
##D # simulate genotypes for F8 individuals
##D ids<- sapply(pedF8$id[pedF8$gen == "F8" & pedF8$sire != "32089"], as.character)
##D gdt<- genoSim(pedF8, gmapF8, ids=ids)
##D dim(gdt)
##D gdt[1:5,1:5]
## End(Not run)



