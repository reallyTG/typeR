library(fuzzr)


### Name: fuzz_function
### Title: Fuzz-test a function
### Aliases: fuzz_function p_fuzz_function

### ** Examples

# Evaluate the 'formula' argument of lm, passing additional required variables
fr <- fuzz_function(lm, "formula", data = iris)

# When evaluating a function that takes ..., set check_args to FALSE
fr <- fuzz_function(paste, "x", check_args = FALSE)

# Pass tests to multiple arguments via a named list
test_args <- list(
   data = test_df(),
   subset = test_all(),
   # Specify custom tests with a new named list
   formula = list(all_vars = Sepal.Length ~ ., one_var = mpg ~ .))
fr <- p_fuzz_function(lm, test_args)



