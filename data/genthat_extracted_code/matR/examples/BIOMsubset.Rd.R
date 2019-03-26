library(matR)


### Name: BIOMsubset
### Title: Take part of (subset) BIOM data
### Aliases: [.biom

### ** Examples

####  explicit subsetting
xx3 [ , 1:8]
xx4 [c ("Bacteria", "Eukaryota"), c ("mgm4575333.3", "mgm4575334.3", "mgm4575335.3")]

####  keep only metagenomes from one biome
xx3 [ , columns (xx3, "biome") == "Tundra biome"]

####  keep only rows matching a search term
xx1 [grepl ("Protein secretion system", rownames(xx1)), ]



