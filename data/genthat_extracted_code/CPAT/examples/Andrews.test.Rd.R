library(CPAT)


### Name: Andrews.test
### Title: Andrews' Test for End-of-Sample Structural Change
### Aliases: Andrews.test

### ** Examples

Andrews.test(rnorm(1000), M = 900)
x <- rnorm(1000)
y <- 1 + 2 * x + rnorm(1000)
df <- data.frame(x, y)
Andrews.test(df, y ~ x, M = 900)



