#
# load BWA assignment
#
dat <- data.frame(load_edge_assignment("../test_data/SSputum-no-RAB/bwa/allReads-bwa.list.txt", type = 'bwa'))

# columns import test
expect_that( dim(dat)[1], equals(558) )

#rows import test
expect_that( dim(dat)[2], equals(4) )

# col names test
expect_that(colnames(dat), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )

# test the specific line of file

# [0.0] subset family
family_table <- dplyr::filter( dat, LEVEL == "species")

# [0.1] subset taxa
ent_row <- dplyr::filter( family_table, TAXA == "Moraxella catarrhalis")

# [0.2] test
expect_that(ent_row$COUNT, equals(135))
expect_that(ent_row$ABUNDANCE, equals(0.3448099714))

#
# test the failure
#
expect_that(load_edge_assignment("../test_data/nonexistentfile.txt", type = 'bwa'), throws_error())

#
# test a BWA 'empty' file
#
empty_df <- load_edge_assignment("../test_data/bwa_emtpy_list.txt", type = 'bwa')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )

#
# test a true empty file
#
empty_df <- load_edge_assignment("../test_data/an_empty_file.tsv", type = 'bwa')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )
