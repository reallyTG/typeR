library(splus2R)


### Name: allTrue
### Title: Test whether all expressions return TRUE
### Aliases: allTrue
### Keywords: utilities

### ** Examples

# This is the type of expression that may be found in a test file
# to be run by do.test -- inside {} are lines that create one or
# more objects, followed by multiple tests (inside allTrue) that
# check those objects.
{
  y <- rnorm(30)
  x <- matrix(rnorm(60), ncol=2)
  fit <- lm(y~x)
  allTrue(# are important components included?
          all(is.element(c("coefficients", "residuals", "effects", "rank",
                           "fitted.values", "assign", "df.residual", "call"),
                         names(fit))),
          {
            # do coefficients match the algebraic form?
            # The algebraic form is inaccurate, so allow greater tolerance
            X <- cbind(1, x)
            all.equal(unname(fit$coefficients),
                      drop(solve( t(X) %*% X, t(X) %*% y)),
                      tol = 1e-5)
          },
          # are residuals computed correctly?
          all.equal(fit$residuals, y - X %*% fit$coefficients))
}
# The second test uses 'unname' to remove names and 'drop' to change a
# matrix to a vector, so the test should pass.
# The third test fails because fit$residuals is a vector with names
# while the %*% calculation returns a matrix.



