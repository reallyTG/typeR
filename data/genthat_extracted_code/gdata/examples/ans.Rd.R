library(gdata)


### Name: ans
### Title: Value of Last Evaluated Expression
### Aliases: ans
### Keywords: programming

### ** Examples

  2+2                  # Trivial calculation...
  ans()                # See the answer again

  gamma(1:15)          # Some intensive calculation...
  fac14 <- ans()       # store the results into a variable

  rnorm(20)            # Generate some standard normal values
  ans()^2              # Convert to Chi-square(1) values...
  stem(ans())          # Now show a stem-and-leaf table



