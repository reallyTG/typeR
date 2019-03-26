library(WebGestaltR)


### Name: WebGestaltR
### Title: WebGestaltR: The R interface for enrichment analysis with
###   WebGestalt.
### Aliases: WebGestaltR WebGestaltR-package WebGestaltRBatch
###   WebGestaltR_batch

### ** Examples

## Not run: 
##D ####### ORA example #########
##D geneFile <- system.file("extdata", "interestingGenes.txt", package="WebGestaltR")
##D refFile <- system.file("extdata", "referenceGenes.txt", package="WebGestaltR")
##D outputDirectory <- getwd()
##D enrichResult <- WebGestaltR(enrichMethod="ORA", organism="hsapiens",
##D   enrichDatabase="pathway_KEGG", interestGeneFile=geneFile,
##D   interestGeneType="genesymbol", referenceGeneFile=refFile,
##D   referenceGeneType="genesymbol", isOutput=TRUE,
##D   outputDirectory=outputDirectory, projectName=NULL)
##D 
##D ####### GSEA example #########
##D rankFile <- system.file("extdata", "GeneRankList.rnk", package="WebGestaltR")
##D outputDirectory <- getwd()
##D enrichResult <- WebGestaltR(enrichMethod="GSEA", organism="hsapiens",
##D   enrichDatabase="pathway_KEGG", interestGeneFile=rankFile,
##D   interestGeneType="genesymbol", sigMethod="top", topThr=10, minNum=5,
##D   outputDirectory=outputDirectory)
##D 
##D ####### NTA example #########
##D enrichResult <- WebGestaltR(enrichMethod="NTA", organism="hsapiens",
##D   enrichDatabase="network_PPI_BIOGRID", interestGeneFile=geneFile,
##D   interestGeneType="genesymbol", sigMethod="top", topThr=10,
##D   outputDirectory=getwd(), highlightSeedNum=10,
##D   networkConstructionMethod="Network_Retrieval_Prioritization")
## End(Not run)




