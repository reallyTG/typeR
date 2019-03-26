library(OTUtable)


### Name: grab_group
### Title: Subset OTU table by taxonomic assignment
### Aliases: grab_group
### Keywords: data_processing

### ** Examples

 
data(otu_table)
data(taxonomy)

acI <- grab_group("acI", "Clade", otu_table, taxonomy)
verruco <- grab_group("Verrucomicrobia", "Phylum", otu_table, taxonomy)

# Example where two search terms are needed due to classification with two databases
methylophilaceae <- grab_group("Methylophilaceae|betIV", "Clade", otu_table, taxonomy)



