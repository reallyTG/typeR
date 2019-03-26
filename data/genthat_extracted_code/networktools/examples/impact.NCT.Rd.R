library(networktools)


### Name: impact.NCT
### Title: Network Comparison Test for Impact Statistics
### Aliases: impact.NCT

### ** Examples

out <- impact.NCT(depression[,1:5], it=5, nodes="psychomotor_retardation")
## No test: 
NCT1 <- impact.NCT(depression, it=25, nodes="psychomotor_retardation")
NCT1$psychomotor_retardation$glstrinv.pval
NCT1$psychomotor_retardation$nwinv.pval
## Both significant

NCT2 <- impact.NCT(social, it=25, nodes="Kim", binary.data=TRUE)
NCT2$Kim$glstrinv.pval
NCT2$Kim$nwinv.pval
## Only global strength impact is significant

##Note: for speed, 25 permutations are iterated here; more permutations are necessary in practice
## End(No test)



