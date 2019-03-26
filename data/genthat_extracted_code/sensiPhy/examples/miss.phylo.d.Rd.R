library(sensiPhy)


### Name: miss.phylo.d
### Title: Phylogenetic signal in missing data
### Aliases: miss.phylo.d

### ** Examples

# Load caper:
library(caper)
# Load data
data(primates)
data<-alien$data
phy=alien$phy[[1]]

# Test phylogenetic signal for missing data:
sexNAsig <- miss.phylo.d(data,phy,binvar=homeRange)
print(sexNAsig)
plot(sexNAsig)

massNAsig <- miss.phylo.d(data,phy,binvar=adultMass)
print(massNAsig)
plot(massNAsig)



