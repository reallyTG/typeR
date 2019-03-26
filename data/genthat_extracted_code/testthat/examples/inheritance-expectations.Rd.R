library(testthat)


### Name: inheritance-expectations
### Title: Expectation: does the object inherit from a S3 or S4 class, or a
###   base type?
### Aliases: inheritance-expectations expect_null expect_type expect_is
###   expect_s3_class expect_s4_class

### ** Examples

expect_is(1, "numeric")
a <- matrix(1:10, nrow = 5)
expect_is(a, "matrix")

expect_is(mtcars, "data.frame")
# alternatively for classes that have an is method
expect_true(is.data.frame(mtcars))

f <- factor("a")
expect_is(f, "factor")
expect_s3_class(f, "factor")
expect_type(f, "integer")

expect_null(NULL)




