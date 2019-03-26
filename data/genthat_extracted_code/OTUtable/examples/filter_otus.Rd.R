library(OTUtable)


### Name: filter_taxa
### Title: Filter Taxa Based on Abundance and Persistence
### Aliases: filter_taxa
### Keywords: data_processing

### ** Examples


# To make a table containing only OTUs with at least 0.1% abundance 
# in at least one sample that were observed 
# (at any abundance) in at least 50% of samples:
# library(OTUtable)
# data(otu_table)
# filtered_table <- filter_taxa(otu_table, abundance = 0.1, persistence = 50)

# To make a table containing only phyla with at least 10% abundance 
# in any one sample and were observed 
# at any abundance in at least 10% of samples:
# data(taxonomy)
# phylum_table <- combine_otus("Phylum", otu_table, taxonomy)
# filtered_phylum_table <- filter_taxa(phylum_table, abundance = 10, persistence = 10)



