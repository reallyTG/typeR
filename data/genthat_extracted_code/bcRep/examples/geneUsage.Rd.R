library(bcRep)


### Name: geneUsage
### Title: Gene usage statistics
### Aliases: geneUsage plotGeneUsage

### ** Examples

data(clones.ind)
geneUsage(genes = clones.ind$V_gene, level = "subgroup", 
     functionality = clones.ind$Functionality_all_sequences)
## Not run: 
##D plotGeneUsage(geneUsage.tab = clones.ind$V_gene, 
##D      plotFunctionality = TRUE)
## End(Not run)



