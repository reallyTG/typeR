library(TCGAretriever)


### Name: get_ext_mutation
### Title: Retrieve Extended Information About DNA Mutations from TCGA
### Aliases: get_ext_mutation

### ** Examples

tp53_mutats <- get_ext_mutation("blca_tcga_all", "blca_tcga_mutations", "TP53")
if(ncol(tp53_mutats) >= 6 & nrow(tp53_mutats) >= 10){
tp53_mutats[1:10,1:6]
}



