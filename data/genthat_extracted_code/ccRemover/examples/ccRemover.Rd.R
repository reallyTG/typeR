library(ccRemover)


### Name: ccRemover
### Title: Removes the effect of the cell-cycle
### Aliases: ccRemover

### ** Examples

set.seed(10)
# Load in example data
data(t.cell_data)
head(t.cell_data[,1:5])
# Center data and select small sample for example
t_cell_data_cen <- t(scale(t(t.cell_data[,1:20]), center=TRUE, scale=FALSE))
# Extract gene names
gene_names <- rownames(t_cell_data_cen)
# Determine which genes are annotated to the cell-cycle
cell_cycle_gene_indices <- gene_indexer(gene_names,
species = "mouse", name_type = "symbol")
# Create "if_cc" vector
if_cc <- rep(FALSE,nrow(t_cell_data_cen))
if_cc[cell_cycle_gene_indices] <- TRUE
# Move data into list
dat <- list(x=t_cell_data_cen, if_cc=if_cc)
# Run ccRemover
## Not run: 
##D  xhat <- ccRemover(dat, cutoff = 3, max_it = 4, nboot = 200, ntop = 10)
## End(Not run)
# Run ccRemover with reduced bootstrap repetitions for example only
xhat <- ccRemover(dat, cutoff = 3, max_it = 4, nboot = 20, ntop = 10)
head(xhat[,1:5])
# Run ccRemover with more compoents considered
## Not run: 
##D xhat <- ccRemover(dat, cutoff = 3, max_it = 4, nboot = 200, ntop = 15)
##D  
## End(Not run)




