library(PAGWAS)


### Name: create.pathway.df
### Title: Creates a pathway data frame
### Aliases: create.pathway.df

### ** Examples

data(SNPs)
data(genes)
data(pathways)
data(genotypes)
snps.genes <- snps.to.genes(snp.info=SNPs,gene.info=genes, distance=0)
pathway.snps <- snps.to.pathways(pathways,snps.genes)
P <- create.pathway.df(genotypes=genotypes,snps.paths=pathway.snps)



