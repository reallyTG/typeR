context('Saving xlsx files')




test_that('save_xlsx saves files to disc for manual check', {
  # Setup
    source(rprojroot::find_testthat_root_file('testdata', 'testdata.R'))
    outdir <- rprojroot::find_testthat_root_file("testout")

  # Try saving a report containing mash tables
    of <- file.path(outdir, 'report_mash.xlsx')
    expect_silent(save_xlsx(t_report_mash, of, overwrite = TRUE))
    expect_true(file.exists(of))

    of <- file.path(outdir, 'report_comp.xlsx')
    expect_silent(save_xlsx(t_report_comp, of, overwrite = TRUE))
    expect_true(file.exists(of))

    of <- file.path(outdir, 'report_stack.xlsx')
    expect_silent(save_xlsx(t_report_stack, of, overwrite = TRUE))
    expect_true(file.exists(of))
})




test_that('save_tex mash_tablesk', {
  # Setup
  source(rprojroot::find_testthat_root_file('testdata', 'testdata.R'))
  outdir <- rprojroot::find_testthat_root_file("testout")

  of <- file.path(outdir, 'mash_table_blank.pdf')
  save_pdf(t_mash_1, of, overwrite = TRUE, keep_source = TRUE, insert_blank_row = TRUE)
  expect_true(file.exists(of))

  of <- file.path(outdir, 'mash_table.pdf')
  save_pdf(t_mash_1, of, overwrite = TRUE, keep_source = TRUE, insert_blank_row = FALSE)
  expect_true(file.exists(of))

  of <- file.path(outdir, 'mash_table.xlsx')
  save_xlsx(t_mash_1, of, overwrite = TRUE)
  expect_true(file.exists(of))
})




test_that('save_pdf works', {
  outdir <- rprojroot::find_testthat_root_file("testout")

  x <- save_pdf(
    iris,
    outfile = file.path(outdir, "iris.pdf"),
    keep_source = TRUE
  )

  expect_true(file.exists(x))
  # open_file(x)
  unlink(x)
})




test_that('save_pdf works', {
  outdir <- rprojroot::find_testthat_root_file("testout")
  source(rprojroot::find_testthat_root_file('testdata', 'testdata.R'))

  meta(t_tagged_1)$footer <- "This the footer bellow the table, let's se how it is formatted"

  x <- save_pdf(
    t_tagged_1,
    outfile = file.path(outdir, "t_tagged_1.pdf"),
    keep_source = TRUE,
    overwrite = TRUE
  )

  cat(as_latex(t_tagged_1))

  expect_true(file.exists(x))
  open_file(x)
  unlink(x)
})




test_that('save_pdf works', {
  outdir <- rprojroot::find_testthat_root_file("testout")
  source(rprojroot::find_testthat_root_file('testdata', 'testdata.R'))

  meta(t_tagged_1)$footer <- "This the footer bellow the table, let's se how it is formatted"

  x <- save_pdf(
    t_tagged_1,
    outfile = file.path(outdir, "t_tagged_1.pdf"),
    keep_source = TRUE,
    overwrite = TRUE
  )

  cat(as_latex(t_tagged_1))

  expect_true(file.exists(x))
  open_file(x)
  unlink(x)


  x <- save_pdf(
    t_report_mash,
    outfile = rprojroot::find_testthat_root_file('testout', 't_report_mash.pdf'),
    overwrite = TRUE,
    keep_source = T
  )

  open_file(x)
  unlink(x)


  x <- save_pdf(
    t_report_comp,
    outfile = rprojroot::find_testthat_root_file('testout', 't_report_comp.pdf'),
    overwrite = TRUE,
    keep_source = T
  )

  open_file(x)
  unlink(x)

})
