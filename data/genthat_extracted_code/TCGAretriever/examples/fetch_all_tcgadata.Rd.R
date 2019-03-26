library(TCGAretriever)


### Name: fetch_all_tcgadata
### Title: Recursively Fetch All Data Included in a TCGA Study Subset
### Aliases: fetch_all_tcgadata

### ** Examples

# Mutations occurring on TP53 and PTEN genes in the bladder cancer study
# Returns 1 data frame: rows = genes; columns = cases
fetch_all_tcgadata("blca_tcga_all", "blca_tcga_mutations", c("PTEN", "TP53"), mutation = FALSE)
# Extended mutations occurring on TP53 and PTEN genes in the bladder cancer study
# Returns 1 data frame: rows = mutations; columns = extended information
fetch_all_tcgadata("blca_tcga_all", "blca_tcga_mutations", c("PTEN", "TP53"), mutation = TRUE)



