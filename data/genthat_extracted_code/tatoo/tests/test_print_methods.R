context("Print methods")

#* @testing compile_report
#* @testing tatoo_report

test_that("Tatoo_report print method", {
#* @testing print.Tatoo_report

  source(file.path(rprojroot::find_testthat_root_file(), 'testdata', 'testdata.R'))
  outfile <- file.path(rprojroot::find_testthat_root_file(), 'testout', 'test_print_methods.txt')

  cat('print(t_meta_simple)\n\n')
  print(t_meta_simple)

  cat('\n\n\n\nprint(t_mash_4)\n\n')
  print(t_mash_4)

  names(t_mash_4) <- c("foo", "bar", "blah")
  print(t_mash_4)

  cat('\n\n\n\nprint(t_mash_4, mash_method = "row", insert_blank_row = TRUE)\n\n')
  print(t_mash_4, mash_method = "row", insert_blank_row = TRUE)

  cat('\n\n\n\nprint(t_comp_1)\n\n')
  print(t_comp_1)

  cat('\n\n\n\nprint(t_stack_2)\n\n')
  print(t_stack_2)

  cat('\n\n\n\nprint(t_report)\n\n')
  print(t_report)
})
