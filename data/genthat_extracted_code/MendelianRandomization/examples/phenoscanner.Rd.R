library(MendelianRandomization)


### Name: phenoscanner
### Title: PhenoScanner
### Aliases: phenoscanner

### ** Examples

# SNP
res <- phenoscanner(snpquery="rs10840293")
head(res$results)
res$snps

# Gene
res <- phenoscanner(genequery="SWAP70")
head(res$results)
res$snps

# Region
res <- phenoscanner(regionquery="chr11:9685624-9774538")
head(res$results)
res$regions



