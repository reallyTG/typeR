library(exams)


### Name: num_to_schoice
### Title: Generate Single-Choice Question List from Numeric Solution
### Aliases: num2schoice num_to_schoice
### Keywords: utilities

### ** Examples

set.seed(1)
## just a correct solution
num_to_schoice(123.45)

## or equivalently
set.seed(1)
num2schoice(123.45)

## just a correct integer solution
num_to_schoice(123, digits = 0)

## a correct solution with a wider range
num_to_schoice(123.45, range = c(0, 200))

## here, the defaults can't work...
## num_to_schoice(0.1234)

## alternatives could be
num_to_schoice(0.1234, range = c(0, 1), delta = 0.03, method = "delta")
num_to_schoice(0.1234, range = c(-5, 5), delta = 0.05)
num_to_schoice(0.1234, wrong = c(0.2749, 1.9723), delta = 0.05)
num_to_schoice(0.1234, wrong = c(0.2749, 1.9723), range = c(-5, 5), delta = 0.05)



