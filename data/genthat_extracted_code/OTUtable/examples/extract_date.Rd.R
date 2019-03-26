library(OTUtable)


### Name: extract_date
### Title: Extract sampling date from a vector of sample names
### Aliases: extract_date
### Keywords: data_processing

### ** Examples


samples <- c("TBE01JUN09.R1", "TBE05JUN09", "TBE10JUN09.R2")
extract_date(samples)

# Extract sample dates from the OTU table
data(otu_table)
x <- extract_date(colnames(otu_table))

# Extract sample dates from the metadata
data(metadata)
x <- extract_date(metadata$Sample_Name)




