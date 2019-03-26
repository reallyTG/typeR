library(PAGWAS)


### Name: snps.to.pathways
### Title: Assigns SNPs to pathways
### Aliases: snps.to.pathways

### ** Examples

data(SNPs)
data(genes)
data(pathways)
snps.genes <- snps.to.genes(snp.info=SNPs,gene.info=genes, distance=50)
pathway.snps <- snps.to.pathways(pathways,snps.genes)



