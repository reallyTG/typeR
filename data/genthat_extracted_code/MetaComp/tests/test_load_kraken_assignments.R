# load DIAMOND assignments
#

# projects
#
data_file <- "../test_data/test_table_kraken.txt"

# read em
#
the_list <- load_edge_assignments(data_file, type = 'kraken')

# tests
#
expect_that(length(the_list), equals(8))

print(paste('kraken'))
expect_that(names(the_list[8]), equals("Project_SSputum-no-RAB"))

#
# test the failure
#
expect_that(load_edge_assignments("../test_data/nonexistentfile.txt", type = 'kraken'), throws_error())
