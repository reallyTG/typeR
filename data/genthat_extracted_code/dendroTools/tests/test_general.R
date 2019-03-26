library(dendroTools)
library(testthat)
library(dplyr)

data(LJ_daily_temperatures)
data(example_proxies_1)
MVA_parameter <- select(example_proxies_1, MVA)
TRW_parameter <- select(example_proxies_1, TRW)

# If test is repeated, equal result should be obtained
test1 <- daily_response(response = MVA_parameter,
                        env_data = LJ_daily_temperatures, method = "lm",
                        lower = 270, upper = 272, row_names_subset = TRUE, seed = 1234)

test2 <- daily_response(response = MVA_parameter,
                        env_data = LJ_daily_temperatures, method = "lm",
                        lower = 270, upper = 272, row_names_subset = TRUE, seed = 1234)

expect_equal(test1, test2)


# daily_response function should return a list with matrix and two characters
test3 <- daily_response(response = example_proxies_1,
  env_data = LJ_daily_temperatures, method = "lm",
  metric = "adj.r.squared", lower = 250, upper = 251, previous_year = FALSE,
  row_names_subset = TRUE)
expect_is(test3, "list")
expect_is(test3[[1]], "matrix")
expect_is(test3[[2]], "character")
expect_is(test3[[2]], "character")


# stop functions were included to prevent wrong results
expect_error(daily_response(response = TRW_parameter,
                            env_data = LJ_daily_temperatures,
                            lower = 200, upper = 270, fixed_width = -368))

expect_error(daily_response(response = example_proxies_1,
  env_data = LJ_daily_temperatures, method = "cor", lower = 250,
  upper = 270, previous_year = FALSE))

expect_error(daily_response(response = example_proxies_1,
  env_data = LJ_daily_temperatures, method = "cor", lower = 280,
  upper = 270, previous_year = FALSE))


# r.squared is squared correlation. Results should be equal
test4 <- daily_response(response = MVA_parameter,
                        env_data = LJ_daily_temperatures, method = "cor",
                        lower = 150, upper = 152, previous_year = FALSE,
                        row_names_subset = TRUE)

test5 <- daily_response(response = MVA_parameter,
                        env_data = LJ_daily_temperatures, method = "lm",
                        lower = 150, upper = 152, previous_year = FALSE,
                        row_names_subset = TRUE)
expect_equal(max(test4[[1]], na.rm = TRUE) ^ 2, max(test5[[1]], na.rm = TRUE))


# A test for critical R
# when the same data is used and alpha is reduced, there should be a higher
# threshold for statistical significance
t1 <- critical_r(100, alpha = 0.05)
t2 <- critical_r(100, alpha = 0.01)
expect_equal(t2 > t1, TRUE)

# when the same alpha is used and number of observations is reduced, higher
# threshold for statistical significance is expected
t1 <- critical_r(100, alpha = 0.05)
t2 <- critical_r(80, alpha = 0.05)
expect_equal(t2 > t1, TRUE)

# If row.names of env_data and response do not match, error should be given
example_proxies_1_temporal <- example_proxies_1
row.names(example_proxies_1_temporal)[1] <- "1520" # random year is assigned
# to row.name of the firest row
expect_error(daily_response(response = example_proxies_1_temporal,
                            env_data = LJ_daily_temperatures,
                            method = "lm", lower = 260, upper = 270,
                            previous_year = FALSE, remove_insignificant = FALSE))


# The order of data is unimportant, if row_names_subset is set to TRUE and
# row.names are years. In this case, data is merged based on matching
# row names.
# will be ordered data
data(example_proxies_1)
MVA_parameter <- dplyr::select(example_proxies_1, MVA)
# Test 8: Usual way of analysing data
test8 <- daily_response(response = MVA_parameter,
                           env_data = LJ_daily_temperatures, method = "lm",
                        metric = "r.squared", lower_limit = 78,
                        upper_limit = 80, row_names_subset = TRUE)

# Test 9: MVA_parameter data.frame is ordered by values of MVA
MVA_parameter_ordered <- MVA_parameter[order(MVA_parameter$MVA), ,
                                         drop = FALSE]
test9 <- daily_response(response = MVA_parameter_ordered,
                           env_data = LJ_daily_temperatures, method = "lm",
                        metric = "r.squared", lower_limit = 78,
                        upper_limit = 80, row_names_subset = TRUE)
expect_equal(test8[[1]], test9[[1]])


# There should be 13 elements in a list returned by daily_response()
expect_equal(length(test8), 13)
