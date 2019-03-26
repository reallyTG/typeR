context("utils")


test_that("sanitize_excel_sheet_names works as expected", {
  #* @testing sanitize_excel_sheet_names(tdat),

  tdat <- 'horrible[ ] * / \ ? : []*/\ ?: namenamenamenamenamenamenamename'
  expect_identical(
    sanitize_excel_sheet_names(tdat),
    "horrible_ _ _ _  _ _ ____ __ na"
  )
})



test_that("getting final row of an openxlsx::workbook works", {

  data <- data.frame(
    x = c(1,2,3),
    y = c(3,4,5)
  )

  wb <- openxlsx::createWorkbook()
  openxlsx::addWorksheet(wb, 'foo')
  openxlsx::addWorksheet(wb, 'bar')

  expect_identical(get_final_wb_row(wb, 'foo'), 0L)

  openxlsx::writeData(wb, 'foo', data)
  expect_identical(get_final_wb_row(wb, 'foo'), 4L)

  openxlsx::writeData(wb, 'bar', data)
  expect_identical(get_final_wb_row(wb, 'bar'), 4L)

  openxlsx::writeData(wb, 'bar', data, startRow = 10)
  expect_identical(get_final_wb_row(wb, 'bar'), 13L)
})
