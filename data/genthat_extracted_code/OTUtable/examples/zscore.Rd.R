library(OTUtable)


### Name: zscore
### Title: Z-score normalize relative abundance data
### Aliases: zscore
### Keywords: data_processing

### ** Examples

data(otu_table)

# Create a small table for z-score normalization
example <- year_subset("05", otu_table)
example <- bog_subset("TBE", example)

# Remove OTUs that are not present in this subset
example <- example[which(rowSums(example) > 0), ]

z_otu_table <- zscore(example)



