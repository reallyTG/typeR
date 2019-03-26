context('Check manual_import')

ctrl_str <- list(tab_suffix = '',
                 sim_suffix = 'sim',
                 tab_names = c('sdtab', 'mutab', 'patab', 'catab', 'cotab', 'mytab', 'extra', 'xptab', 'cwtab'))

ctrl_data <- xpose_data(file = 'run001.lst', dir = 'data', ignore = c('files', 'summary'), 
                        quiet = TRUE)$data$index[[1]] %>% 
  dplyr::filter(.$table == 'sdtab001') %>% 
  dplyr::arrange_(.dots = 'table')

# Tests start here --------------------------------------------------------
test_that('manual_nm_import function works properly', {
  expect_equal(manual_nm_import(), ctrl_str)
})

test_that('list_nm_tables_manual returns error when cannot guess runno', {
  expect_error(list_nm_tables_manual(runno = NULL, file = 'sim.lst', dir = 'data', 
                                     tab_list = manual_nm_import(tab_names = 'sdtab')),
               regexp = 'Check \\?manual_nm_import for help.')
})

test_that('list_nm_tables_manual function works properly', {
  test <- xpose_data(file = 'run001.lst', dir = 'data', ignore = c('files', 'summary'),
                     manual_import = manual_nm_import(tab_names = 'sdtab'), 
                     quiet = FALSE)$data$index[[1]]
  test <- dplyr::arrange_(.data = test, .dots = 'table')
  expect_identical(test, ctrl_data)
})
