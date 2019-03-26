library(bcRep)


### Name: compare.geneUsage
### Title: Compare gene usage of different samples
### Aliases: compare.geneUsage plotCompareGeneUsage

### ** Examples

data(aaseqtab)
data(aaseqtab2)

Vgenes.comp<-compare.geneUsage(gene.list = list(aaseqtab$V_GENE_and_allele, 
     aaseqtab2$V_GENE_and_allele), level = "subgroup", abundance = "relative", 
     names = c("IndA", "IndB"), nrCores = 1)
## Not run: 
##D plotCompareGeneUsage(comp.tab = Vgenes.comp, color = c("gray97", "darkblue"), PDF = "Example")
## End(Not run)



