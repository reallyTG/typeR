library(jaatha)


### Name: create_jaatha_model.function
### Title: Specify a jaatha model using a simulation function
### Aliases: create_jaatha_model.function

### ** Examples

create_jaatha_model(function(x) rpois(10, x),
                    par_ranges = matrix(c(0.1, 0.1, 10, 10), 2, 2),
                    sum_stats = list(create_jaatha_stat("sum", sum)))



