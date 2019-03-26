context('Check xpdb_access functions')

# Define files to be tested -----------------------------------------------
xpdb_vpc <- xpdb_ex_pk %>% 
  vpc_data(quiet = TRUE) %>% 
  vpc_data(vpc_type = 'censored', opt = vpc_opt(lloq = 0.4), quiet = TRUE)

# Tests for get_code ------------------------------------------------------

test_that('get_code checks input properly', {
  # Error with missing xpdb
  expect_error(get_code(), regexp = '"xpdb" is missing')
  
  # Error with bad problem input
  expect_error(get_code(xpdb_ex_pk, .problem = 99), regexp = '\\$prob no.99 not found in model code')
})

test_that('get_code works properly', {
  # Return full code
  expect_equal(get_code(xpdb_ex_pk), xpdb_ex_pk$code)
  
  # Return single problem
  expect_equal(get_code(xpdb_ex_pk, .problem = 1), xpdb_ex_pk$code[xpdb_ex_pk$code$problem == 1, ])
  
  # Return multiple problems
  expect_equal(get_code(xpdb_ex_pk, .problem = 0:1), xpdb_ex_pk$code[xpdb_ex_pk$code$problem %in% 0:1, ])
})


# Tests for get_data ------------------------------------------------------
test_that('get_data checks input properly', {
  # Error with missing xpdb
  expect_error(get_data(), regexp = '"xpdb" is missing')
  
  # Error with simulataneous table and problems
  expect_error(get_data(xpdb_ex_pk, table = 'sdtab001', .problem = 1), regexp = 'together')
  
  # Error with bad problem input
  expect_error(get_data(xpdb_ex_pk, .problem = 99), regexp = '\\$prob no.99 not found')
  
  # Error with bad table input
  expect_error(get_data(xpdb_ex_pk, table = 'faketab'), regexp = 'faketab not found')
})

test_that('get_data works properly', {
  # Default return works properly
  expect_message(tmp_get_data_1 <- get_data(xpdb_ex_pk), regexp = 'Returning data from \\$prob no\\.1')
  expect_equal(tmp_get_data_1, xpdb_ex_pk$data$data[[1]])
  
  # Return single problem
  expect_equal(get_data(xpdb_ex_pk, .problem = 1), xpdb_ex_pk$data$data[[1]])
  
  # Return single table
  expect_equal(get_data(xpdb_ex_pk, table = 'sdtab001'), 
               xpdb_ex_pk$data$data[[1]][, xpdb_ex_pk$data$index[[1]]$col[xpdb_ex_pk$data$index[[1]]$table == 'sdtab001']])
  # Return multiple tables
  expect_equal(get_data(xpdb_ex_pk, table = c('sdtab001', 'patab001')), 
               list(sdtab001 = xpdb_ex_pk$data$data[[1]][xpdb_ex_pk$data$index[[1]]$col[xpdb_ex_pk$data$index[[1]]$table == 'sdtab001']],
                    patab001 = xpdb_ex_pk$data$data[[1]][xpdb_ex_pk$data$index[[1]]$col[xpdb_ex_pk$data$index[[1]]$table == 'patab001']]))
})


# Tests for get_file ------------------------------------------------------
test_that('get_file checks input properly', {
  # Error with missing xpdb
  expect_error(get_file(), regexp = '"xpdb" is missing')
  
  # Error with missing file
  expect_error(get_file(xpdb_ex_pk), regexp = '`file` or `ext` required')
  
  # Error with bad file input
  expect_error(get_file(xpdb_ex_pk, file = 'fakefile'), regexp = 'fakefile not found')
  
  # Error with bad problem input
  expect_error(get_file(xpdb_ex_pk, file = 'run001.ext', .problem = 99), regexp = '\\$prob no.99 not found')
  
  # Error with bad sub-problem input
  expect_error(get_file(xpdb_ex_pk, file = 'run001.ext', .subprob = 99), regexp = 'Subprob no.99 not found')
})

test_that('get_file works properly', {
  # Return single file
  expect_equal(get_file(xpdb_ex_pk, file = 'run001.ext', .problem = 1, .subprob = 0, quiet = TRUE), 
               xpdb_ex_pk$files[xpdb_ex_pk$files$name == 'run001.ext', ]$data[[1]])
  
  # Return multiple files
  expect_equal(get_file(xpdb_ex_pk, file = c('run001.ext', 'run001.phi')), 
               list(`run001.ext_prob_1_subprob_0_foce` = 
                      xpdb_ex_pk$files[xpdb_ex_pk$files$name == 'run001.ext', ]$data[[1]],
                    `run001.phi_prob_1_subprob_0_foce` = 
                      xpdb_ex_pk$files[xpdb_ex_pk$files$name == 'run001.phi', ]$data[[1]]))
})

test_that('get_file is quiet when option is set in xpdb', {
  # Change quiet to TRUE
  xpdb_quiet <- xpdb_ex_pk
  xpdb_quiet$options$quiet <- TRUE
  xpdb_quiet <- as.xpdb(xpdb_quiet)
  
  expect_silent(get_file(xpdb_quiet, file = 'run001.ext'))
})


# Tests for get_summary ---------------------------------------------------
test_that('get_summary checks input properly', {
  # Error with missing xpdb
  expect_error(get_summary(), regexp = '"xpdb" is missing')
  
  # Error with bad problem input
  expect_error(get_summary(xpdb_ex_pk, .problem = 99), regexp = '\\$prob no.99 not found')
  
  # Error with bad sub-problem input
  expect_error(get_summary(xpdb_ex_pk, .subprob = 99), regexp = 'Subprob no.99 not found')
})

test_that('get_summary works properly', {
  # Return single problem
  expect_equal(get_summary(xpdb_ex_pk, .problem = 1), xpdb_ex_pk$summary[xpdb_ex_pk$summary$problem == 1, ])
  
  # Return multiple problems
  expect_equal(get_summary(xpdb_ex_pk, .problem = 0:1), xpdb_ex_pk$summary[xpdb_ex_pk$summary$problem %in% 0:1, ])
})


# Tests for get_prm -------------------------------------------------------

test_that('get_prm checks input properly', {
  xpdb_no_ext <- xpdb_ex_pk
  xpdb_no_ext$files <- xpdb_no_ext$files[xpdb_no_ext$files$extension != 'ext', ]
  xpdb_no_ext <- as.xpdb(xpdb_no_ext)
  
  # Error with missing xpdb
  expect_error(get_prm(), regexp = '"xpdb" is missing')
  
  # Error with no ext file
  expect_error(get_prm(xpdb_no_ext), regexp = 'File extension `ext` not found in model output files')
  
  # Error with bad problem input
  expect_error(get_prm(xpdb_ex_pk, .problem = 99), 
               regexp = 'No parameter estimates found for \\$prob no\\.99')
  
  xpdb_wo_cov <- purrr::modify_at(xpdb_ex_pk, 'files', ~dplyr::filter(.x, extension != 'cov'))
  xpdb_wo_cov <- as.xpdb(xpdb_wo_cov)
  
  expect_warning(get_prm(xpdb_wo_cov, quiet = TRUE), 
                 regex = 'Covariance matrix.+not available')
})


test_that('get_prm works properly', {
  
  # Load control parameter table
  # get_prm_ctrl_tr <- get_prm(xpdb_ex_pk, transform = TRUE)
  # save(get_prm_ctrl_tr, file = 'data/get_prm_ctrl_tr.Rdata')
  load('data/get_prm_ctrl_tr.Rdata')
  
  # get_prm_ctrl_ntr <- get_prm(xpdb_ex_pk, transform = FALSE)
  # save(get_prm_ctrl_ntr, file = 'data/get_prm_ctrl_ntr.Rdata')
  load('data/get_prm_ctrl_ntr.Rdata')
  
  # get_prm_ctrl_no_se <- xpdb_ex_pk %>%
  #   filter(.source = 'ext', .problem = 1, ITERATION != '-1000000001') %>% 
  #   get_prm(transform = FALSE)
  # save(get_prm_ctrl_no_se, file = 'data/get_prm_ctrl_no_se.Rdata')
  load('data/get_prm_ctrl_no_se.Rdata')
  
  # Test w/ transform
  get_prm_test_tr <- get_prm(xpdb_ex_pk, transform = TRUE, quiet = TRUE)
  expect_true('xpose_prm' %in% class(get_prm_test_tr))
  expect_identical(get_prm_test_tr, get_prm_ctrl_tr)
  
  # Test w/o transform
  get_prm_test_ntr <- get_prm(xpdb_ex_pk, transform = FALSE, quiet = TRUE)
  expect_true('xpose_prm' %in% class(get_prm_test_ntr))
  expect_identical(get_prm_test_ntr, get_prm_ctrl_ntr)
  
  # Test w/o SE
  get_prm_test_no_se <- xpdb_ex_pk %>% 
    filter(.source = 'ext', .problem = 1, ITERATION != '-1000000001') %>% 
    get_prm(transform = FALSE, quiet = TRUE)
  expect_true('xpose_prm' %in% class(get_prm_test_no_se))
  expect_identical(get_prm_test_no_se, get_prm_ctrl_no_se)
  
  # Test w/o FIXED iteration
  expect_warning(xpdb_ex_pk %>% 
                   filter(.source = 'ext', .problem = 1, ITERATION != '-1000000006') %>% 
                   get_prm(transform = FALSE, quiet = TRUE),
                 regexp = 'Iteration `-1000000006` not found')
})


# Tests for get_special ---------------------------------------------------
test_that('get_special checks input properly', {
  # Error with missing xpdb
  expect_error(get_special(), regexp = '"xpdb" is missing')
  
  # Error with bad problem input
  expect_error(get_special(xpdb_vpc, .problem = 99), regexp = '\\$prob no.99 not found')
})

test_that('get_data works properly', {
  # Default return works properly
  expect_message(tmp_get_special_1 <- get_special(xpdb_vpc), regexp = 'Returning vpc censored data from \\$prob no\\.4')
  expect_equal(tmp_get_special_1, xpdb_vpc$special$data[[2]])
  
  # Return single problem
  expect_equal(get_special(xpdb_vpc, .problem = 3), xpdb_vpc$special$data[[1]])
  
  # Return multiple problems
  expect_equal(get_special(xpdb_vpc, .problem = 3:4), 
               list(problem_3_vpc_continuous = xpdb_vpc$special$data[[1]],
                    problem_4_vpc_censored = xpdb_vpc$special$data[[2]]))
})
