library(TCGAretriever)


### Name: get_protein_data
### Title: Retrieve Protein Expression Data from a TCGA Study
### Aliases: get_protein_data

### ** Examples

# Protein Expression Only
blca_protein <- get_protein_data("blca_tcga_sequenced", FALSE)
if (nrow(blca_protein) > 10 & ncol(blca_protein) > 8) {
  blca_protein[1:8,1:8]
} else {
message("Server may be down, please try again later...")
}
#
# Example including Antibody Information
blca_protein <- get_protein_data("blca_tcga_sequenced", TRUE)
if (nrow(blca_protein) > 10 & ncol(blca_protein) > 8) {
  blca_protein[1:8,1:8]
} else {
message("Server may be down, please try again later...")
}



