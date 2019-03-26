library(TCGAretriever)


### Name: get_case_lists
### Title: Retrieve All Case List Available for a Specific TCGA Study
### Aliases: get_case_lists

### ** Examples

all_case_lists <- get_case_lists("blca_tcga")
if(ncol(all_case_lists) >= 3) {
all_case_lists[,1:3]
}



