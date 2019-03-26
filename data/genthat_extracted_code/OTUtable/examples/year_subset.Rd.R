library(OTUtable)


### Name: year_subset
### Title: Subset samples by a specific year
### Aliases: year_subset
### Keywords: data_processing

### ** Examples

data(otu_table)

seven <- year_subset("07", otu_table)

# Select two years at once
two_years <- year_subset("07|08", otu_table)



