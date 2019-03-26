## ------------------------------------------------------------------------
my_function <- function(x, n, delim = " - ") {
  paste(rep(x, n), collapse = delim)
}

my_function("fuzz", 7)

## ---- results = "asis"---------------------------------------------------
library(fuzzr)
# Note that, while we are specifically fuzz testing the 'n' argument, we still 
# need to provide an 'x' argument to pass along to my_function(). We do not have
# to supply a delimiter, as my_function() declares a default value for this
# argument.
my_fuzz_results <- fuzz_function(my_function, "n", x = 1:3, tests = test_all())

# Produce a data frame summary of the results
fuzz_df <- as.data.frame(my_fuzz_results)
knitr::kable(fuzz_df)

## ------------------------------------------------------------------------
fuzz_call(my_fuzz_results, n = "dbl_single")
fuzz_value(my_fuzz_results, n = "dbl_single")

fuzz_call(my_fuzz_results, n = "date_single")
# Hm, dates can be coerced into very large integers. Let's see how long this
# result is.
nchar(fuzz_value(my_fuzz_results, n = "date_single"))
# Oh dear.

## ---- results = "asis"---------------------------------------------------
my_function_2 <- function(x, n, delim = " - ") {
  assertthat::assert_that(assertthat::is.count(n))
  paste(rep(x, n), collapse = delim)
}

# We will abbreviate this check by only testing against double and date vectors
fuzz_df_2 <- as.data.frame(fuzz_function(my_function_2, "n", x = "fuzz", 
                                         tests = c(test_dbl(), test_date())))

knitr::kable(fuzz_df_2)

## ---- results = 'asis'---------------------------------------------------
p_args <- list(
  x = list(
    simple_char = "test",
    numbers = 1:3
  ),
  n = test_all(),
  delim = test_all())

pr <- p_fuzz_function(my_function_2, p_args)
prdf <- as.data.frame(pr)

knitr::kable(head(prdf))

