library(soobench)


### Name: counting_function
### Title: Return a new function which is identical to the 'soofunction'
###   passed in except that all function evaluations are counted.
### Aliases: counting_function

### ** Examples

f <- counting_function(double_sum_function(5))
number_of_evaluations(f)
y <- f(random_parameters(1, f))
number_of_evaluations(f)
reset_evaluation_counter(f)
number_of_evaluations(f)
y <- f(random_parameters(21, f))
number_of_evaluations(f)



