context("Testing function count_CO")

library(reshape2)

source("test_data_generator.R")

genotype_table <- Ref_Alt_Table(make_marker_names(fake_markers))

fake_geno_data <- initialize_genotypeR_data(seq_data=genotypes_data, genotype_table=genotype_table, warning_allele="Ref", output="warnings2NA")

##get expectation
##dcast(SAMPLE_NAME+WELL~MARKER, value.var =  "GENOTYPE", data=genotypes(fake_geno_data))
##naive_CO <- list(c(0,1,0,1), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
##non_naive_CO <- list(c(0,1,0.5,0.5), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))

fake_geno_binary <- binary_coding(fake_geno_data, genotype_table=genotype_table)

non_naive_fake_geno_CO <- count_CO(fake_geno_binary, naive=FALSE)
naive_fake_geno_CO <- count_CO(fake_geno_binary, naive=TRUE)
######################################################

##tests
test_that("The correct number COs", {    
naive_CO <- list(c(0,1,0,1), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
expect_equal(counted_crossovers(naive_fake_geno_CO)$crossovers, apply(do.call(rbind, naive_CO), 2, sum))

non_naive_CO <- list(c(0,1,0.5,0.5), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0), c(0,0,0,0))
expect_equal(counted_crossovers(non_naive_fake_geno_CO)$crossovers, apply(do.call(rbind, non_naive_CO), 2, sum))
})

test_that("Genetic distances are correct; this test all aspects of function", {
##centimorgans/Mb
cM_per_Mb_CO <- counted_crossovers(naive_fake_geno_CO)$crossovers/counted_crossovers(naive_fake_geno_CO)$num_ind/((counted_crossovers(naive_fake_geno_CO)$end-counted_crossovers(naive_fake_geno_CO)$start)/100000000)

expect_equal(counted_crossovers(naive_fake_geno_CO)$cMperMb_CO, cM_per_Mb_CO)


##Kosambi
Kosambi <- function(x){
    a <- 1 + (2*x)
    b <- 1 - (2*x)    
    d <- 0.25*log(a/b)
    Kosambi_distance <- d*100
    return(Kosambi_distance)
}

Kosambi_distance <- Kosambi(counted_crossovers(naive_fake_geno_CO)$crossovers/counted_crossovers(naive_fake_geno_CO)$num_ind)

expect_equal(counted_crossovers(naive_fake_geno_CO)$Kosambi_cM, Kosambi_distance)

})


