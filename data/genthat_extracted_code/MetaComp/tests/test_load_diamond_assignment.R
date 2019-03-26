#
# load DIAMOND assignment
#
dat <- data.frame(load_edge_assignment(file.path("../test_data/test_all_taxa/",
  "allReads-diamond.list.txt"), type = 'diamond'))

# columns import test
expect_that( dim(dat)[1], equals(234) )

#rows import test
expect_that( dim(dat)[2], equals(4) )

# col names test
expect_that(colnames(dat), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )

# test the specific line of file

# [0.0] subset family
family_table <- dplyr::filter( dat, LEVEL == "family")

# [0.1] subset taxa
# family	Enterobacteriaceae	31718	12910	543	0.0958
ent_row <- dplyr::filter( family_table, TAXA == "Enterobacteriaceae")

# [0.2] test
expect_that(ent_row$COUNT, equals(12910))
expect_that(ent_row$ABUNDANCE, equals(0.0958))

#
# test the failure
#
expect_that(load_edge_assignment("../test_data/nonexistentfile.txt", type = 'diamond'), throws_error())

#
# test an empty file
#
empty_df <- load_edge_assignment("../test_data/an_empty_file.tsv", type = 'diamond')
expect_that(colnames(empty_df), equals( c("LEVEL", "TAXA", "COUNT", "ABUNDANCE") ) )
expect_that(dim(empty_df)[1], equals(0) )
