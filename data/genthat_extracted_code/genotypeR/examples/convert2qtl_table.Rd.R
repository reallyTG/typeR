library(genotypeR)


### Name: convert2qtl_table
### Title: write out table for import into rqtl
### Aliases: convert2qtl_table
### Keywords: genotypeR, rqtl

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
binary_coding_genotypes <- binary_coding(warnings_out2NA, genotype_table = GT_table)
chr2 <- subsetChromosome(binary_coding_genotypes, chromosome="chr2")
count_CO <- count_CO(chr2)
convert2qtl_table(count_CO, paste(temp_cross_for_qtl=getwd(),
"test_temp_cross.csv", sep="/"),
chromosome_vect=rep("2", (length(colnames(binary_genotypes(count_CO)))-2)))





