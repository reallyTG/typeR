context("Stacked_table")

#* @testing stack_table
#* @testing stack_table_list
#* @testing stacked_table

test_that("Stacked_table works as expected", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  # Constructor works
    expect_silent(
      tres1 <- stack_table(t_mash_1, t_comp_3, t_df1, meta = t_meta_verbose)
    )
    expect_is(tres1, 'Stacked_table')
    expect_identical(length(tres1), 3L)


  # List constructor works
    expect_silent(tres2 <- stack_table_list(
      list(t_mash_1, t_comp_3, t_df1), meta = t_meta_verbose
    ))
    expect_identical(tres1, tres2)
})
