library(PAGWAS)


### Name: SNAL
### Title: Sparse Normal/Adaptive lasso method for finding associated
###   pathways
### Aliases: SNAL

### ** Examples

## Not run: 
##D 	data(genotypes)
##D 	G=genotypes
##D 	data(pathways)
##D 	data(SNPs)
##D 	data(genes)
##D 	snps.genes=snps.to.genes(SNPs,genes,distance=0)
##D 	snps.paths=snps.to.pathways(pathways,snps.genes)
##D 	P=create.pathway.df(G,snps.paths)
##D 	y=rnorm(nrow(G),mean=0,sd=10)
##D 	SNAL(y,G,P,a,s2)
## End(Not run)



