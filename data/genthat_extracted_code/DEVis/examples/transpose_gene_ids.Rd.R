library(DEVis)


### Name: transpose_gene_ids
### Title: Rename gene IDs based on a 1-to-1 mapping file.
### Aliases: transpose_gene_ids
### Keywords: id rename transpose

### ** Examples

## Not run: 
##D 
##D #Transpose IDs from current count data to their desired values based on the meta_file.
##D count_data  <- prep_counts(my_count_file)
##D new_count_data <- transpose_gene_ids(count_data, meta_file)
##D 
##D #Updated gene ID count information can be used in DE analysis.
##D dds <- prep_dds_from_data(new_count_data, target_data, ~ Design_Type, TRUE,
##D                            "Replicate", "vst")
##D 
## End(Not run)



