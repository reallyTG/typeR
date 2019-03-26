library(curry)


### Name: tail_curry
### Title: Curry a function from the end
### Aliases: %-<% tail_curry

### ** Examples

# Equivalent to tail_curry(`/`, 5)
divide_by_5 <- `/` %-<% 5
divide_by_5(10)

no_factors <- data.frame %-<% FALSE
no_factors(x = letters[1:5])




