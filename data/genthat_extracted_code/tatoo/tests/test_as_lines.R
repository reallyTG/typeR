context("as_lines")


test_that("Tatoo_report print method", {
  #* @testing print.Tatoo_report

  source(file.path(rprojroot::find_testthat_root_file(), 'testdata', 'testdata.R'))
  outfile <- file.path(rprojroot::find_testthat_root_file(), 'testout', 'test_print_methods.txt')

  cat('\n')
  print_lines(as_lines(t_meta_simple, color = FALSE))
  print_lines(as_lines(t_mash_4, color = FALSE))
  print_lines(as_lines(t_mash_4, mash_method = "row", color = FALSE))
  print_lines(as_lines(t_mash_4, mash_method = "row", insert_blank_row = TRUE, color = FALSE))
  print_lines(as_lines(t_comp_1, color = FALSE))
  print_lines(as_lines(t_stack_2, color = FALSE))
  print_lines(as_lines(t_report, color = FALSE))
  cat('\n[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[\n\n')


  print_lines(as_lines(t_meta_simple, color = TRUE))
  print_lines(as_lines(t_mash_4, color = TRUE))
  print_lines(as_lines(t_mash_4, mash_method = "row", color = TRUE))
  print_lines(as_lines(t_mash_4, mash_method = "row", insert_blank_row = TRUE, color = TRUE))
  print_lines(as_lines(t_comp_1, color = TRUE))
  print_lines(as_lines(t_stack_2, color = TRUE))
  print_lines(as_lines(t_report, color = TRUE))
})
