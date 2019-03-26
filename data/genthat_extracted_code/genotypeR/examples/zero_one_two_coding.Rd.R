library(genotypeR)


### Name: zero_one_two_coding
### Title: Code genotypes as 0, 1, 2
### Aliases: zero_one_two_coding
### Keywords: 0 1 2 Alt Heterozygous, Homozygous Ref, and as code genotypes

### ** Examples


data(genotypes_data)
data(markers)
## genotype table
marker_names <- make_marker_names(markers)
GT_table <- Ref_Alt_Table(marker_names)
## remove those markers that did not work
genotypes_data_filtered <- genotypes_data[,c(1, 2, grep("TRUE",
colnames(genotypes_data)%in%GT_table$marker_names))]

pass_through <- initialize_genotypeR_data(seq_data = genotypes_data_filtered,
genotype_table = GT_table, output = "pass_through")

genotypes_object <- zero_one_two_coding(pass_through, GT_table)




