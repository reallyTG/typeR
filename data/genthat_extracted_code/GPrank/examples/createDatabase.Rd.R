library(GPrank)


### Name: createDatabase
### Title: Building SQLite database
### Aliases: createDatabase
### Keywords: database

### ** Examples

BF=c(3,10,2)
FoldChange=c(0.5,3,5)
dbParams=list("BF"=BF,"Fold change"=FoldChange)
identifiers=c("geneA","geneB","geneC")
dbInfo=list(database_name="testdb","database_params"=dbParams,"identifiers"=identifiers)
figs=c("geneA_gene.png","geneA_abstr.png","geneA_reltr.png","geneB_gene.png",
"geneB_abstr.png","geneB_reltr.png","geneC_gene.png","geneC_abstr.png","geneC_reltr.png")
for (i in seq(1,9)) {
	examplefig=figs[i] 
     png(examplefig)
     plot(c(0, 1), c(0, 1))
     dev.off()
}
createDatabase(dbInfo,figs)




