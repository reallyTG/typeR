# load DIAMOND assignments
#

# projects
#
data_file <- "../test_data/test_table_diamond.txt"

# read em
#
the_list <- load_edge_assignments(data_file, type = 'diamond')

# tests
#
expect_that(length(the_list), equals(3))

expect_that(names(the_list)[3], equals("test_all_taxa"))

#
# test the failure
#
expect_that(load_edge_assignments("../test_data/nonexistentfile.txt", type = 'diamond'), throws_error())
