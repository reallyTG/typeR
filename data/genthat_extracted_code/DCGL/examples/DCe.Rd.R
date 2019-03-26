library(DCGL)


### Name: DCe
### Title: Identify DCGs (Differentially Coexpressed Genes) and DCLs
###   (Differentially Coexpressed Links)
### Aliases: DCe
### Keywords: DCGs DCLs

### ** Examples

data(exprs)
## Identifying DCGs and DCLs by DCe method
DCe.res<-DCe(exprs[1:100,1:16],exprs[1:100,17:63],
	link.method = 'qth',
	cutoff=0.25,
	nbins=20,p=0.1)
DCe.res$DCGs[1:3,]
DCe.res$DCLs[1:3,]



