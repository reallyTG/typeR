library(genotypeR)


### Name: CO
### Title: Where crossovers occur per individual with 2 ways to deal with
###   missing data
### Aliases: CO
### Keywords: count crossovers genotypeR

### ** Examples


library(doBy)
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
binary_coding_genotypes <- binary_coding(warnings_out2NA, genotype_table = GT_table)
chr2 <- subsetChromosome(binary_coding_genotypes, chromosome="chr2")
to_count_CO <- binary_genotypes(chr2)
counted_per_individuals <- lapply(splitBy(~SAMPLE_NAME+WELL, data=to_count_CO), CO)




