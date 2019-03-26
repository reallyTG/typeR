library(hypergea)


### Name: hypergeom.test
### Title: Hypergeometric test
### Aliases: hypergeom.test
### Keywords: hypergeometric test OpenMP

### ** Examples

	##########
	## example from Zelterman (1999), p. 119, Table 4.1
	## mice were exposed to a fungicide (or not), some have a tumor
	##########
	dmn <- list(Tumor=c('y', 'n'), Exposition=c('y', 'n'))
	CT <- matrix(c(4,12,5,74), nrow=2, dimnames=dmn)
	## Not run: CT
	hypergeom.test(CT)

	## Not run: 
##D 	##########
##D 	## example from Agresti (1992), Table 2
##D 	## Fisher's tea tasting experiment
##D 	##########
##D 	dmn <- list('poured first'=c('m', 't'), guess=c('m', 't'))
##D 	CT <- matrix(c(3,1,1,3), nrow=2, dimnames=dmn)
##D 	hypergeom.test(CT, alternative="two.sided")
##D 	hypergeom.test(CT, alternative="two.sided", pval.method="double")
##D 	out <- hypergeom.test(CT, alternative="two.sided", pval.method=NULL)
##D 	hypergeom.test(CT, alternative="less")
##D 	hypergeom.test(CT, alternative="greater")
##D 	
## End(Not run)


	##########
	## example from Zelterman (1999), p. 44, Table 1.2
	## Response to three drugs
	##########
	dmn <- list(A=c('F', 'U'), B=c('F', 'U'), C=c('F', 'U'))
	CT <- array(c(6,16,2,4,2,4,6,6), dim=c(2,2,2), dimnames=dmn)
	## Not run: CT
	hypergeom.test(CT)




