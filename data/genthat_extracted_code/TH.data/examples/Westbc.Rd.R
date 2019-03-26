library(TH.data)


### Name: Westbc
### Title: Breast Cancer Gene Expression
### Aliases: Westbc
### Keywords: datasets

### ** Examples


  ## Not run: 
##D     library("Biobase")
##D     data("Westbc", package = "TH.data")
##D     westbc <- new("ExpressionSet",
##D           phenoData = new("AnnotatedDataFrame", data = Westbc$pheno),
##D           assayData = assayDataNew(exprs = Westbc$assay))
##D   
## End(Not run)



