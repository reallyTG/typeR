context('Check read_nm_model')

# Define files to be tested -----------------------------------------------
ctrl_mod   <- xpdb_ex_pk$code

# Tests start here --------------------------------------------------------

test_that('error is returned when missing file and runno arguments', {
  expect_error(read_nm_model(), regexp = 'Argument `runno` or `file` required.')
})

test_that('error is returned when extension is unrecognized', {
  expect_error(read_nm_model(file = 'run001.exe', dir = 'data'), regexp = 'NONMEM model file extension should be one lst, out, res, mod or ctl.')
})

test_that('error is returned when file does not exist', {
  expect_error(read_nm_model(file = 'fake_mod.lst', dir = 'data'), regexp = 'Model file fake_mod.lst not found.')
})

test_that('properly parses a model given via the file and dir arguments', {
  expect_equal(read_nm_model(file = 'run001.lst', dir = 'data'), ctrl_mod)
})

test_that('properly parses a model given via the runno and dir arguments', {
  expect_equal(read_nm_model(runno = '001', ext = '.lst', dir = 'data'), ctrl_mod)
})

test_that('properly handles missing code in output file', {
  expect_warning(recover_model <- read_nm_model(runno = '002', ext = '.lst', dir = 'data'), 
                 regexp = 'No model code found in `.lst` NONMEM output file importing `.mod` instead.')
  expect_equal(recover_model, ctrl_mod[-c(1, which(ctrl_mod$level > 30)), ])
})

test_that('problem record is present even if no text has been supplied',{
  expect_true('pro' %in% read_nm_model(file = 'sim.lst', dir = 'data')[['subroutine']])
})
