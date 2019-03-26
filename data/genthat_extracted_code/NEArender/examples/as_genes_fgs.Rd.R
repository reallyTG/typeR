library(NEArender)


### Name: as_genes_fgs
### Title: Create single-gene FGS
### Aliases: as_genes_fgs

### ** Examples

data(net.kegg)
net <- import.net(net.kegg)
fgs.genes <- as_genes_fgs(net)
print(fgs.genes[1:10])



