library(lmem.qtler)


### Name: qtl.cross
### Title: Read genomic data to perform QTL analyses.
### Aliases: qtl.cross

### ** Examples

data (SxM_geno)
data (SxM_map)
data (SxM_pheno)

P.data <- SxM_pheno
G.data <- SxM_geno
map.data <- SxM_map

cross.data <- qtl.cross (P.data, G.data, map.data,
cross='dh', heterozygotes = FALSE)
summary (cross.data)




