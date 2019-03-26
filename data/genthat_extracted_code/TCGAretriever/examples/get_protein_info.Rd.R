library(TCGAretriever)


### Name: get_protein_info
### Title: Retrieve Information on Antibodies Used for Protein Levels
###   Determination
### Aliases: get_protein_info

### ** Examples

info1 <- get_protein_info("blca_tcga", glist = c("TP53", "PTEN", "E2F1", "AKT1"))
if (nrow(info1) > 0) {
  message("Total protein levels information")
  info1
} else {
message("Server may be down, please try again later...")
}
info2 <- get_protein_info("blca_tcga", "phosphorilation", c("TP53", "PTEN", "E2F1", "AKT1"))
if (nrow(info2) > 0) {
  message("Phospho-protein levels information")
  info2
} else {
message("Server may be down, please try again later...")
}



