context("save_xlsx")

#* @testing save_xlsx
#* @testing save_xlsx.default
#* @testing as_workbook.Tatoo_report
#* @testing as_workbook.default
#* @testing write_worksheet
#* @testing write_worksheet.default
#* @testing write_worksheet.Tagged_table
#* @testing write_worksheet.Mashed_table
#* @testing write_worksheet.Composite_table
#* @testing write_worksheet.Stacked_table

test_that('save_xlsx saves files to disc', {
  # Setup
    source(file.path(test_path(), 'testdata', 'testdata.R'))
    of <- file.path(tempdir(), 'test.xlsx')

  # Try saving a report containing mash tables
    save_xlsx(t_report_mash, of, overwrite = TRUE)
    expect_true(file.remove(of))


  # Try saving a report containing comp tables
    save_xlsx(t_report_comp, of, overwrite = TRUE)
    expect_true(file.remove(of))


  # Try saving a report containing stack tables
    save_xlsx(t_report_stack, of, overwrite = TRUE)
    expect_true(file.remove(of))
})
