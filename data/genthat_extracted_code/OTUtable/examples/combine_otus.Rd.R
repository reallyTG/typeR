library(OTUtable)


### Name: combine_otus
### Title: Combine OTUs based on identical taxonomic assignments
### Aliases: combine_otus
### Keywords: data_processing

### ** Examples


data(otu_table)
data(taxonomy)

example_table <- year_subset("05", otu_table)
example_table <- bog_subset("TBE", example_table)

phylum_table <- combine_otus("Phylum", example_table, taxonomy)




