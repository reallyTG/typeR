library(grex)


### Name: grex
### Title: Gene ID Mapping for Genotype-Tissue Expression (GTEx) Data
### Aliases: grex

### ** Examples

# Ensembl IDs in GTEx v6p gene count data
data("gtexv6p")
# select 100 IDs as example
id = gtexv6p[101:200]
df = grex(id)
# Rows that have a mapped Entrez ID
df[!is.na(df$"entrez_id"),
   c("ensembl_id", "entrez_id", "gene_biotype")]



