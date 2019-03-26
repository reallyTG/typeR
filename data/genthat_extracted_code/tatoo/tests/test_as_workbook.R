context("as_workbook")
#* @testing as_workbook
#* @testing as_workbook.default
#* @testing as_workbook.Tagged_table
#* @testing as_workbook.Mashed_table
#* @testing as_workbook.Composite_table
#* @testing as_workbook.Stacked_table
#* @testing as_workbook.Tatoo_report


test_that("as_workbook works as expected", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  for(el in list(t_df1, t_mash_1, t_comp_1, t_stack_1))
  {
    # Check if workbook project is created without warnings or errors
    tres <- as_workbook(el, blah = "blubb", keepNA = TRUE)
    expect_is(tres, 'Workbook')

    # Check if workbook object contains the appropriate number of sheets
    if(!inherits(el, 'Tatoo_report')){
      expect_identical(length(names(tres)), 1L)
    } else {
      expect_identical(names(tres), names(el))
    }
  }
})



test_that("Tagged_table and default named regions are created correctly", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  footer(t_tagged_1) <- c("blah", "blubb")
  wb  <- as_workbook(t_tagged_1)
  res <- openxlsx::getNamedRegions(wb)
  expect_setequal(
    attr(res, "position"),
    c("A1:A3", "A5:D10", "A5:D5", "A6:D10", "A12:A13")
  )

  footer(t_tagged_1) <- NULL
  wb  <- as_workbook(t_tagged_1)
  res <- openxlsx::getNamedRegions(wb)
  expect_setequal(
    attr(res, "position"),
    c("A1:A3", "A5:D10", "A5:D5", "A6:D10")
  )

  title(t_tagged_1) <- NULL
  table_id(t_tagged_1) <- NULL
  longtitle(t_tagged_1) <- NULL
  subtitle(t_tagged_1) <- NULL

  wb  <- as_workbook(t_tagged_1)
  res <- openxlsx::getNamedRegions(wb)

  expect_setequal(
    attr(res, "position"),
    c("A2:D7", "A2:D2", "A3:D7")
  )
})




test_that("Mashed_table named regions are created correctly", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  wb  <- as_workbook(t_mash_1)
  res <- openxlsx::getNamedRegions(wb)
  expect_identical(
    attr(res, "position"),
    c("A1:D21", "A1:D1", "A2:D21")
  )

  wb  <- as_workbook(t_mash_4)
  res <- openxlsx::getNamedRegions(wb)
  expect_identical(
    attr(res, "position"),
    c("A1:A3", "A5:J5", "A6:J11", "A6:J6", "A7:J11", "A13:A13")
  )
})




test_that("Composite_table named regions are created correctly", {
  source(file.path(test_path(), 'testdata', 'testdata.R'))

  wb  <- as_workbook(t_comp_1)
  res <- openxlsx::getNamedRegions(wb)
  expect_setequal(
    attr(res, "position"),
    c("A1:I1", "A2:I8", "A2:I2", "A3:I8")
  )

  wb  <- as_workbook(t_comp_3)
  res <- openxlsx::getNamedRegions(wb)
  expect_setequal(
    attr(res, "position"),
    c("A1:A3", "A5:G5", "A6:G12", "A6:G6", "A7:G12", "A14:A14")
  )
})


# devtools::load_all()
# outdir <- rprojroot::find_testthat_root_file("testout")
# save_xlsx(wb, file.path(outdir, "test.xlsx"), overwrite = TRUE)
