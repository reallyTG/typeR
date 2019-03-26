library(TCGAretriever)


### Name: get_cancer_studies
### Title: Retrieve a List of Cancer Studies Available at TCGA
### Aliases: get_cancer_studies

### ** Examples

all_studies <- get_cancer_studies()
message(paste("There are", nrow(all_studies), "studies currently available..."))
if(ncol(all_studies) >= 2) {
  head(all_studies[,1:2])
}



