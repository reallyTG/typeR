library(LEGIT)


### Name: plot.LEGIT
### Title: Plot
### Aliases: plot.LEGIT

### ** Examples

train = example_2way(500, 1, seed=777)
fit = LEGIT(train$data, train$G, train$E, y ~ G*E, train$coef_G, train$coef_E)
plot(fit)



