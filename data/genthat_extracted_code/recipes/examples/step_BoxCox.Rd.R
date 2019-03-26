library(recipes)


### Name: step_BoxCox
### Title: Box-Cox Transformation for Non-Negative Data
### Aliases: step_BoxCox tidy.step_BoxCox
### Keywords: datagen

### ** Examples


rec <- recipe(~ ., data = as.data.frame(state.x77))

bc_trans <- step_BoxCox(rec, all_numeric())

bc_estimates <- prep(bc_trans, training = as.data.frame(state.x77))

bc_data <- bake(bc_estimates, as.data.frame(state.x77))

plot(density(state.x77[, "Illiteracy"]), main = "before")
plot(density(bc_data$Illiteracy), main = "after")

tidy(bc_trans, number = 1)
tidy(bc_estimates, number = 1)




