# load GOTTCHA assignments
#

# projects
#
data_file <- "../test_data/test_table_gottcha.txt"

# read em
#
the_list <- load_edge_assignments(data_file, type = 'gottcha')

# tests
#
expect_that(length(the_list), equals(7))

print(paste('gottcha'))
expect_that(names(the_list[7]), equals("Project_SSputum-no-RAB"))

#
# test the failure
#
expect_that(load_edge_assignments("../test_data/nonexistentfile.txt", type = 'gottcha'), throws_error())
