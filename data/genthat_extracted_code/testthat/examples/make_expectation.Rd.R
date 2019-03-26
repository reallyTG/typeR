library(testthat)


### Name: make_expectation
### Title: Make an equality test.
### Aliases: make_expectation
### Keywords: internal

### ** Examples

x <- 1:10
make_expectation(x)

make_expectation(mtcars$mpg)

df <- data.frame(x = 2)
make_expectation(df)



