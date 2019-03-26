library(ccRemover)


### Name: gene_indexer
### Title: Identifies genes annotated to the cell-cycle
### Aliases: gene_indexer

### ** Examples

set.seed(10)
# Load in example data
data(t.cell_data)
head(t.cell_data[,1:5])
# Center example data
t_cell_data_cen <- t(scale(t(t.cell_data), center=TRUE, scale=FALSE))
# Extract gene names
gene_names <- rownames(t_cell_data_cen)
# Determine which genes are annotated to the cell-cycle
cell_cycle_gene_indices <- gene_indexer(gene_names = gene_names,
species = "mouse", name_type = "symbol")
# Create "if_cc" vector
if_cc <- rep(FALSE,nrow(t_cell_data_cen))
if_cc[cell_cycle_gene_indices] <- TRUE

# Can allow the function to automatically detect the name type
cell_cycle_gene_indices <- gene_indexer(gene_names = gene_names,
species = NULL, name_type = NULL)




