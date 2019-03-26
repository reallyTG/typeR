#
# load GOTTCHA2 assignment
#
dat <- data.frame(load_edge_assignment(file.path("../test_data/SRR353621/SRR353621_gottcha2-speDB-refseq",
  "allReads.summary.tsv"), type = 'gottcha2'))

# columns import test
expect_that( dim(dat)[1], equals(201) )

#rows import test
expect_that( dim(dat)[2], equals(4) )

# col names test
expect_that(colnames(dat), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )

# test the specific line of file

# [0.0] subset family
family_table <- dplyr::filter( dat, LEVEL == "family")

# [0.1] subset taxa
ent_row <- dplyr::filter( family_table, TAXA == "Micrococcaceae")

# [0.2] test
expect_that(ent_row$COUNT, equals(40))
expect_that(ent_row$ABUNDANCE, equals(0.0189))

#
# test the failure
#
expect_that(load_edge_assignment("../test_data/nonexistentfile.txt", type = 'gottcha2'), throws_error())

#
# test an empty file
#
empty_df <- load_edge_assignment("../test_data/an_empty_file.tsv", type = 'gottcha2')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )
