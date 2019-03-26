library(olsrr)


### Name: ols_step_best_subset
### Title: Best subsets regression
### Aliases: ols_step_best_subset ols_best_subset plot.ols_step_best_subset

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_step_best_subset(model)

# plot
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
k <- ols_step_best_subset(model)
plot(k)




