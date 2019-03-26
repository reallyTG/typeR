library(genotypeR)


### Name: binary_coding
### Title: Code genotypes as binary
### Aliases: binary_coding
### Keywords: as binary code genotypes

### ** Examples


data(genotypes_data)
data(markers)
## genotype table
marker_names <- make_marker_names(markers)
GT_table <- Ref_Alt_Table(marker_names)
## remove those markers that did not work
genotypes_data_filtered <- genotypes_data[,c(1, 2, grep("TRUE",
colnames(genotypes_data)%in%GT_table$marker_names))]

warnings_out2NA <- initialize_genotypeR_data(seq_data = genotypes_data_filtered,
genotype_table = GT_table, output = "warnings2NA")

genotypes_object <- binary_coding(warnings_out2NA, GT_table)




