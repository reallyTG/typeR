library(ofGEM)


### Name: forest_plot
### Title: Forest plot
### Aliases: forest_plot

### ** Examples



coef = matrix(rnorm(6 * 6), 6, 6)
se = matrix(abs(runif(6 * 6, 0.1, 0.15)), 6, 6)

forest_plot(coef, se)




