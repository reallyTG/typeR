library(olsrr)


### Name: ols_step_all_possible
### Title: All possible regression
### Aliases: ols_step_all_possible ols_all_subset
###   plot.ols_step_all_possible

### ** Examples

model <- lm(mpg ~ disp + hp, data = mtcars)
k <- ols_step_all_possible(model)
k

# plot
plot(k)




