context('Check printing method for xpose_plots')

# Define plots to be tested -----------------------------------------------
# Facet wrap
p1 <- xplot_scatter(xpdb = xpdb_ex_pk, aes_string(x = 'PRED', y = 'DV'), quiet = TRUE)
p2 <- xplot_scatter(xpdb = xpdb_ex_pk, aes_string(x = 'PRED', y = 'DV'), 
                    facets = ~SEX, quiet = TRUE, ncol = 1, nrow = 1, page = 1)
p3 <- xplot_scatter(xpdb = xpdb_ex_pk, aes_string(x = 'PRED', y = 'DV'), 
                    facets = 'SEX', quiet = TRUE, ncol = 1, nrow = 1, page = c(1, 2),
                    caption = 'Page @page of @lastpage')

# Tests start here --------------------------------------------------------

test_that('warnings and errors are properly returned', {
  paths_1 <- file.path(tempdir(), 'Rplot.pdf')
  on.exit(unlink(paths_1))
  
  pdf(file = paths_1) # Used to capture and cleanup print output
  expect_warning(print(p1, page = 2), regexp = 'Faceting not set')
  expect_warning(print(p2, page = 2:4), regexp = '`page` contained elements exceeding the total')
  expect_error(print(p2, page = 99), regexp = 'All `page` element exceeded the total')
  dev.off()
})

test_that('console output are silenced with quiet', {
  expect_message(xplot_scatter(xpdb = xpdb_ex_pk, aes_string(x = 'PRED', y = 'DV'),
                               facets = DOSE~SEX, quiet = FALSE, ncol = 1, nrow = 1,
                               page = 1), regex = 'Using data from')
  expect_silent(xplot_scatter(xpdb = xpdb_ex_pk, aes_string(x = 'PRED', y = 'DV'),
                              facets = DOSE~SEX, quiet = TRUE, ncol = 1, nrow = 1,
                              page = 1:2))
})

test_that('paginate function works properly', {
  expect_equal(paginate(plot = p3, page_2_draw = 1, page_tot = 2)$labels$caption,
               'Page 1 of 2')
})
