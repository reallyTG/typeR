library(treeman)


### Name: searchTxnyms
### Title: Get node labels based on online taxonomic database
### Aliases: searchTxnyms

### ** Examples

tree <- randTree(8)
new_tids <- c("Gallus_gallus", "Aileuropoda_melanoleucha", "Ailurus_fulgens",
"Rattus_rattus", "Mus_musculus", "Gorilla_gorilla", "Pan_trogoldytes", "Homo_sapiens")
tree <- setNdsID(tree, tree['tips'], new_tids)
nd_labels <- searchTxnyms(tree)
print(nd_labels)



