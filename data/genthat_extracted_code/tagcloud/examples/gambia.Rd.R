library(tagcloud)


### Name: gambia
### Title: Results of GO enrichment analysis in TB
### Aliases: gambia
### Keywords: datasets tagcloud

### ** Examples

data(gambia)
tagcloud( gambia$Term, -log( gambia$Pvalue ) )



