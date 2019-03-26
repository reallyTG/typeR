library(clusteval)


### Name: sim_data
### Title: Wrapper function to generate data from a variety of
###   data-generating models.
### Aliases: sim_data

### ** Examples

set.seed(42)
uniform_data <- sim_data(family = "uniform")
normal_data <- sim_data(family = "normal", delta = 2)
student_data <- sim_data(family = "student", delta = 1, df = 1:5)



