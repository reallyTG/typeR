context("as_lines")


test_that("Tatoo_report print method", {
  #* @testing print.Tatoo_report

  source(file.path(rprojroot::find_testthat_root_file(), 'testdata', 'testdata.R'))


  show_regions <- function(x){
   unique(regions(as_workbook(x))$region)
 }

  show_regions(t_report_stack)

})
