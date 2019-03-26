#
# load GOTTCHA assignment
#
dat <- load_edge_assignment(file.path("../test_data/SSputum-dil-DNase-cDNA/gottcha-strDB-b",
            "allReads-gottcha-strDB-b.list.txt"), type = 'gottcha')

# columns import test
expect_that( dim(dat)[1], equals(65) )

#rows import test
expect_that( dim(dat)[2], equals(4) )

# col names test
expect_that(colnames(dat), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )

# test the specific line of file
# LEVEL	TAXA	ROLLUP	ASSIGNED	LINEAR_LENGTH	TOTAL_BP_MAPPED	HIT_COUNT	HIT_COUNT_PLASMID	READ_COUNT	LINEAR_DOC	NORM_COV
# species	Veillonella parvula	0.0375		10606	12569	396	0	198	1.18508391476523	0.0375168122114549

# [0.0] subset family
species_table <- dplyr::filter( dat, LEVEL == "species")

# [0.1] subset taxa
ent_row <- dplyr::filter( species_table, TAXA == "Haemophilus influenzae")

# [0.2] test
expect_that(ent_row$ABUNDANCE, equals(0.04961472))

#
# test the failure
#
expect_that(load_edge_assignment("../test_data/nonexistentfile.txt", type = 'gottcha'), throws_error())

#
# test an empty file
#
empty_df <- load_edge_assignment("../test_data/an_empty_file.tsv", type = 'gottcha')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )
