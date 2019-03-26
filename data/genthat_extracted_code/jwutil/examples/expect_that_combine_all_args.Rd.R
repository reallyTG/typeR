library(jwutil)


### Name: expect_that_combine_all_args
### Title: alternative 'expect_that' from 'testthat' which permutes all the
###   inputs to a function which should give the same result where n args
###   >=2 and the function is commutative.
### Aliases: expect_that_combine_all_args expect_that_combine_first_arg

### ** Examples

 expect_that_combine_all_args(sum(1, 2, 3),
  testthat::equals(6))
## Not run: 
##D expect_that_combine_all_args(stop("a", "b"), testthat::throws_error())
##D expect_that_combine_all_args(sum(1, 2), testthat::equals(3))
##D expect_that_combine_first_arg(sum(c(1, 2)), testthat::equals(3))
## End(Not run)



