context("Testing function subsetChromosome")

source("test_data_generator.R")

##make up fake data from fake data
##in other words change chrx to chry
##test against genotypes_data
genotypes_data_y <- genotypes_data
colnames(genotypes_data_y) <- gsub("chrx", "chry", colnames(genotypes_data_y))
xy <- merge(genotypes_data, genotypes_data_y)

genotype_table <- Ref_Alt_Table(make_marker_names(fake_markers))
genotype_table_y <- genotype_table
genotype_table_y$marker_names <- gsub("chrx", "chry", genotype_table_y$marker_names)
xy_table <- rbind(genotype_table, genotype_table_y)

fake_geno_data <- initialize_genotypeR_data(seq_data=xy, genotype_table=xy_table, warning_allele="Ref", output="pass_through")
fake_geno_data_test <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="pass_through")

fake_geno_data_subset_chrx <- subsetChromosome(fake_geno_data, chromosome="chrx")

test_that("Correct subset", {

    ##must drop unused factor levels chry
    chrx_test <- genotypes(fake_geno_data_subset_chrx)

    chrx_test$MARKER <- droplevels(chrx_test$MARKER)
    
    expect_equal(chrx_test, genotypes(fake_geno_data_test))
})
