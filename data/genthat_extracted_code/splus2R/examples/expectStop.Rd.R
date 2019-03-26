library(splus2R)


### Name: expectStop
### Title: Test whether expected stop() or warning() messages are produced.
### Aliases: expectStop expectWarnings
### Keywords: utilities error

### ** Examples

# Expressions like the following would typically be included in a file
# that is called by do.test

expectStop(lm(5), expected = "invalid formula")

expectStop(cov2cor( matrix(2:1) ),
           expected = "'V' is not a square numeric matrix")

expectWarnings( # Test subscript replacement; should discard extra
                # column and give a warning
  {
    x <- data.frame(a=1:3,b=2:4)
    x[,3] <- x
    all.equal(ncol(x), 3)
  },
  expected = "provided 2 variables to replace 1 var")

# Test for a warning and stop together:
{
  f <- function(x){
    warning("a warning")
    stop("a stop")
  }
  expectStop( expectWarnings( f(3), expected = "a warning"),
              expected = "a stop")
}
# The definition of f and the call to expectStop are included here
# within {} because that is how they would typically be grouped in
# a file that is called by do.test.  Also note that f has been saved
# (the assignment of f is committed, rather than aborted).



