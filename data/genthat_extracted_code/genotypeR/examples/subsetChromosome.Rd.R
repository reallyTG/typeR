library(genotypeR)


### Name: subsetChromosome
### Title: Subset genotypeR object by chromosome
### Aliases: subsetChromosome
### Keywords: by chromosome genotypeR object subset

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
chromosome_subset <- subsetChromosome(warnings_out2NA, "chr2")




