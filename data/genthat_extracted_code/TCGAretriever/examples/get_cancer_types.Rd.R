library(TCGAretriever)


### Name: get_cancer_types
### Title: Retrieve a List of Cancer Types as Defined by the TCGA
###   Guidelines
### Aliases: get_cancer_types

### ** Examples

all_canc <- get_cancer_types()
message(paste("There are", nrow(all_canc), "types on cancer defined at TCGA..."))
head(all_canc)



