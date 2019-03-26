context('Check list_nm_tables')

# Define files to be tested -----------------------------------------------
simtab_test <- structure(
  dplyr::tibble(problem    = 1,
                level      = c(19, 20, 20, 21),
                subroutine = c('sig', rep('tab', 3)),
                code       = c('0.3', 
                               'ID OCC DOSE AMT SS II TIME TAD IPRED CWRES CPRED IWRES',
                               'EVID ONEHEADER NOPRINT FILE =my_sdtab-001a.tab',
                               'ID KA CL V ALAG1 ETAS(1:LAST) ONEHEADER NOPRINT FILE= some-tab_001.csv'),
                comment = ''),
  file  = 'run001.mod', dir   = 'data',
  class = c('nm_model', 'tbl_df', 'tbl', 'data.frame'))

fail_test1 <- structure(simtab_test[1, ],
                        file  = 'run001.mod', dir   = 'data',
                        class = c('nm_model', 'tbl_df', 'tbl', 'data.frame'))

fail_test2 <- structure(simtab_test[1:2, ],
                        file  = 'run001.mod', dir   = 'data',
                        class = c('nm_model', 'tbl_df', 'tbl', 'data.frame'))

sdtab_test <- read_nm_model(file = 'run001.lst', dir = 'data')

null_object <- as.nm.table.list(dplyr::tibble(problem = -1, file = '', 
                                              firstonly = NA, simtab = NA))

# Tests start here --------------------------------------------------------

test_that('error is returned when missing nm_model argument', {
  expect_error(list_nm_tables())
})

test_that('error is returned when input is not a nm_model', {
  expect_error(list_nm_tables(nm_model = dplyr::tibble(problem = 1, level = 10, 
                                                       subroutine = 'tab', code = 'FILE=sdtab001',
                                                       comment = '')))
})

test_that('null object is returned no $TABLE are listed in the code', {
  expect_equal(list_nm_tables(nm_model = fail_test1), null_object)
})

test_that('null object is returned no valid file names are found under $TABLE', {
  expect_equal(list_nm_tables(nm_model = fail_test2), null_object)
})

test_that('works with simulation problems', {
  simtab_out <- list_nm_tables(nm_model = simtab_test)
  
  expect_true(is.nm.table.list(simtab_out))
  expect_false(any(simtab_out$firstonly))
  expect_true(all(simtab_out$simtab))
  expect_equal(simtab_out$file, file.path('data', c('my_sdtab-001a.tab', 'some-tab_001.csv')))
})

test_that('works with estimation problems', {
  sdtab_out <- list_nm_tables(nm_model = sdtab_test)
  
  expect_true(is.nm.table.list(sdtab_out))
  expect_equal(sdtab_out$firstonly, c(FALSE, FALSE, TRUE, TRUE, FALSE))
  expect_equal(sdtab_out$simtab, c(FALSE, FALSE, FALSE, FALSE, TRUE))
  expect_equal(sdtab_out$file, file.path('data', c('sdtab001', 'catab001.csv', 'cotab001', 'patab001', 'simtab001')))
})
