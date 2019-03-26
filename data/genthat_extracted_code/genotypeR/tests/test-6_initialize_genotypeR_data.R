context("Testing function initialize_genotypeR_data")

source("test_data_generator.R")

genotype_table <- Ref_Alt_Table(make_marker_names(fake_markers))

fake_geno_data <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="pass_through")

fake_geno_data_warn2NA <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="warnings2NA")

##get expectation
##dcast(SAMPLE_NAME+WELL~MARKER, value.var =  "GENOTYPE", data=genotypes(fake_geno_data))
##naive_CO <- list(c(0,1,0,1), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
##non_naive_CO <- list(c(0,1,0.5,0.5), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))

fake_geno_binary <- binary_coding(fake_geno_data, genotype_table=genotype_table)

non_naive_fake_geno_CO <- count_CO(fake_geno_binary, naive=FALSE)

test_that("initialize_genotypeR produces the right class", {    

    expect_is(non_naive_fake_geno_CO, "genotypeR")
    
})

test_that("initialize_genotypeR accesor functions return expected result", {    
    ##impossible_genotype
    expect_equal(impossible_genotype(non_naive_fake_geno_CO), "Ref")

    ##genotypes
##    library(reshape)
    geno <- melt(genotypes_data, id.vars=c("SAMPLE_NAME", "WELL"))
    geno[geno$value=="","value"] <- NA
    colnames(geno) <- c("SAMPLE_NAME", "WELL", "MARKER", "GENOTYPE")
    geno$GENOTYPE <- as.character(geno$GENOTYPE)
    expect_identical(genotypes(non_naive_fake_geno_CO), geno)

    ##binary_genotypes
    ##turn warnings into 0s to match test data
    test_binary <- binary_genotypes(non_naive_fake_geno_CO)
    test_binary[is.na(test_binary)] <- FALSE
    test_binary[test_binary=="G" | test_binary=="A"] <- 0
    test_binary[test_binary==FALSE] <- NA
    expect_equal(test_binary, test_data)

    ##counted_crossovers
    non_naive_CO <- list(c(0,1,0.5,0.5), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
expect_equal(counted_crossovers(non_naive_fake_geno_CO)$crossovers, apply(do.call(rbind, non_naive_CO), 2, sum))
})
