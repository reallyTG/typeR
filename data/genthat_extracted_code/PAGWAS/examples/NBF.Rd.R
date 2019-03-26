library(PAGWAS)


### Name: NBF
### Title: Normal/Bayes factors method for finding associated pathways
### Aliases: NBF

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
##D 	NBF(y,G,P,a,b,s2,nu)
## End(Not run)



