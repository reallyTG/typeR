context('Check read_nm_files')

# Define files to be tested -----------------------------------------------
test_file1 <- c('ID          KA          CL          V           ALAG1       ETA1        ETA2        ETA3        DV          PRED        RES         WRES',
                '  1.1000E+02  4.1052E-01  2.5483E+01  1.4917E+02  2.3223E-01 -4.5845E-02 -3.5313E-03 -2.1460E+00  0.0000E+00 -3.6889E+00  0.0000E+00  0.0000E+00',
                '  1.1000E+02  4.1052E-01  2.5483E+01  1.4917E+02  2.3223E-01 -4.5845E-02 -3.5313E-03 -2.1460E+00 -2.4841E+00 -5.6877E-01 -1.9153E+00 -3.8853E+00')

test_file2 <- c('TABLE NO.  4',
                ' ID          KA          CL          V           ALAG1       ETA1        ETA2        ETA3        DV          PRED        RES         WRES',
                '  1.1000E+02  4.1052E-01  2.5483E+01  1.4917E+02  2.3223E-01 -4.5845E-02 -3.5313E-03 -2.1460E+00  0.0000E+00 -3.6889E+00  0.0000E+00  0.0000E+00',
                '  1.1000E+02  4.1052E-01  2.5483E+01  1.4917E+02  2.3223E-01 -4.5845E-02 -3.5313E-03 -2.1460E+00 -2.4841E+00 -5.6877E-01 -1.9153E+00 -3.8853E+00')

ctrl_file1 <- xpdb_ex_pk$files

# Tests start here --------------------------------------------------------

test_that('error is returned when missing file argument', {
  expect_error(read_nm_files(quiet = TRUE), 
               regexp = 'Argument `runno` or `file` required')
})

test_that('error is returned when all provided files are missing', {
  expect_error(read_nm_files(runno = 'run999', dir = 'data', quiet = TRUE),
               regexp = 'No output files could be found')
})

test_that('read_nm_files handles one file with inappropriate format', {
  file1 <- tempfile(pattern = 'run001', fileext = '.phi')
  file2 <- tempfile(pattern = 'run001', fileext = '.grd')
  file3 <- tempfile(pattern = 'run001', fileext = '.ext')
  on.exit(unlink(c(file1,file2, file3)))
  
  writeLines(text = test_file1, con = file1)
  writeLines(text = test_file2, con = file2)
  writeLines(text = test_file2, con = file3) 
  expect_warning(tmp_file_A <- read_nm_files(file = c(file1, file2, file3), quiet = TRUE), 
                 regexp = 'Dropped.+inappropriate format')
  expect_is(tmp_file_A, class = 'tbl_df')
})

test_that('read_nm_files handles all files with inappropriate format', {
  file4 <- tempfile(pattern = 'run001', fileext = '.phi')
  file5 <- tempfile(pattern = 'run001', fileext = '.grd')
  file6 <- tempfile(pattern = 'run001', fileext = '.ext')
  on.exit(unlink(c(file4, file5, file6)))
  
  writeLines(text = test_file1, con = file4)
  writeLines(text = test_file1, con = file5)
  writeLines(text = test_file1, con = file6)
  
  expect_error(suppressWarnings(read_nm_files(file = c(file4, file5, file6), quiet = TRUE)), 
               regexp = 'No output file imported')
})

test_that('files are imported correctly', {
  skip_on_cran() # Unknown error on CRAN !
  
  expect_identical(read_nm_files(runno = '001', dir = 'data', quiet = TRUE), ctrl_file1)
  expect_identical(read_nm_files(file = paste0('run001', c('.ext', '.cor', '.cov', '.phi', '.grd', '.shk')), 
                                 dir = 'data', quiet = TRUE), ctrl_file1)
})
