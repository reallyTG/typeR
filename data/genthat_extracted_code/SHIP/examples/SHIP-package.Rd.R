library(SHIP)


### Name: SHIP-package
### Title: SHrinkage covariance Incorporating Prior knowledge
### Aliases: SHIP-package
### Keywords: package

### ** Examples

# A short example on a toy dataset
# require(SHIP)

data(expl)
attach(expl)

sig1 <- shrink.estim(x,targetD(x))
sig2 <- shrink.estim(x,targetF(x))
sig3 <- shrink.estim(x,targetCor(x,genegroups))
sig4 <- shrink.estim(x,targetG(x,genegroups))

paste(sig1[[2]],collapse=" ")
paste(sig2[[2]],collapse=" ")
paste(sig3[[2]],collapse=" ")
paste(sig4[[2]],collapse=" ")

## Not run: 
##D # Example on how to get the gene groups lists
##D require(hgu95av2.db)
##D # e.g. we have some interesting gene names :
##D vec <- c("MYC","ID2","PTGER4","ATF4","FGFR1","MET","HLA-DRB6")
##D # we then want to convert them into Probe Sets
##D symb <- as.list(hgu95av2SYMBOL)
##D pbsets <- names(symb[unlist(sapply(vec,function(x,l) which(l==x)[1],symb))])
##D # Probe Sets which are themselves converted into a gene groups list
##D genegroups <- as.list(hgu95av2PATH)[pbsets]
## End(Not run)



