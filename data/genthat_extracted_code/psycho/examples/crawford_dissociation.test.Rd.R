library(psycho)


### Name: crawford_dissociation.test
### Title: Crawford-Howell (1998) modified t-test for testing difference
###   between a patient’s performance on two tasks.
### Aliases: crawford_dissociation.test

### ** Examples

library(psycho)

case_X <- 142
case_Y <- 7
controls_X <- c(100, 125, 89, 105, 109, 99)
controls_Y <- c(7, 8, 9, 6, 7, 10)

crawford_dissociation.test(case_X, case_Y, controls_X, controls_Y)



