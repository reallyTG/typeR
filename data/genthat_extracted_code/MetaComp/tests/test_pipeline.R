# this tests the whole pipeline
#

# define the path to the test data folder
#
test_data_folder <- dirname(getwd())

# the configuration file
#
test_data_file <- file.path(test_data_folder, "test_data/test_table_gottcha.txt")

# execute the common pipeline
#

# [0.0]
assignments <- load_edge_assignments(test_data_file, type = 'gottcha')

# [1.0]
merged_assignments_table <- merge_edge_assignments(assignments)

# [2.0] create a folder
#
tmp_folder <- file.path(getwd(), "sandbox")
dir.create(path = tmp_folder, recursive = TRUE, showWarnings = FALSE)

# [2.1] create the pdf
#
gplot <- plot_merged_assignment(assignment = merged_assignments_table,
                                taxonomy_level = "family",
                                sorting_order = "abundance",
                                row_limit = 60,
                                plot_title = "Test Plot #3",
                                filename = file.path(tmp_folder, "test_pdf3"))

# [2.2] test that file exists
#
expect_that(file.exists(file.path(tmp_folder, "test_pdf3.pdf")), is_true())

# [2.3] clean up
#
unlink(tmp_folder, recursive = T)
