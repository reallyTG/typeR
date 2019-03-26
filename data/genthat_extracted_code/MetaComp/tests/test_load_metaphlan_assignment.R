#
# load METAPHLAN assignment
#
dat <- load_edge_assignment(file.path("../test_data/SSputum-dil-DNase-cDNA/metaphlan",
        "allReads-metaphlan.list.txt"), type = 'metaphlan')

# columns import test
expect_that( dim(dat)[1], equals(25) )

#rows import test
expect_that( dim(dat)[2], equals(4) )

# col names test
expect_that(colnames(dat)[1], matches("LEVEL"))

#
expect_that(colnames(dat)[ dim(dat)[2] ], matches("ABUNDANCE"))

# [0.0] subset family
family_table <- dplyr::filter( dat, LEVEL == "family")

# [0.1] subset taxa
ent_row <- dplyr::filter( family_table, TAXA == "Propionibacteriaceae")

# [0.2] test
expect_that(ent_row$ABUNDANCE, equals(15.76274))

#
# test the failure
#
expect_that(load_edge_assignment("../test_data/nonexistentfile.txt", type = 'metaphlan'), throws_error())

#
# test an empty file
#
empty_df <- load_edge_assignment("../test_data/an_empty_file.tsv", type = 'metaphlan')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )
