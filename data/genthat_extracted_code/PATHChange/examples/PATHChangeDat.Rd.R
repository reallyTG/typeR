library(PATHChange)


### Name: PATHChangeDat
### Title: PATHChangeDat
### Aliases: PATHChangeDat

### ** Examples

# For Ontocancro pathways, you can download a file with all genes from 
# http://ontocancro.inf.ufsm.br/download/genes_ontocancro.zip

require(rlist)
eDat<-system.file("extdata", "eDat.csv", package = "PATHChange")
genes<-system.file("extdata", "genes.txt", package="PATHChange")

## Not run: 
##D PATHChangeDat(eDat=eDat, DataSet="GSE35972", NumbSample=6, Genes=genes, 
##D               HistComp=FALSE, hc=c("untreated", "treated with"), writeRDS=FALSE)
## End(Not run)
## Not run: MeanData <- list.load(file.path(tempdir(),"MeanData.rds"))



