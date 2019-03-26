library(OTUtable)


### Name: bog_subset
### Title: Subset OTU table by sampling site
### Aliases: bog_subset
### Keywords: data_processing

### ** Examples

data(otu_table)

Trout_Bog_Epilimnion <- bog_subset("TBE", otu_table)

Hells_Kitchen_Hypolimnion <- bog_subset("HKH", otu_table)

# Include both epilimnion and hypolimnion in a single table
Trout_Bog_both_layers <- bog_subset("TB.", otu_table)

# Include all meromictic hypolimnia
meromictic_hypolimnia <- bog_subset("HKH|MAH", otu_table)




