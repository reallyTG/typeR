library(bioset)


### Name: models_linear
### Title: Linear model functions.
### Aliases: models_linear fit_linear plot_linear interpolate_linear

### ** Examples

# generate data
x <- c(1, 3, 4, 7)
y_known <- c(3.5, 6.5, 8, 12.5)  # x is known for these values
y_unknown <- c(5, 9.5, 11)       # we will calculate x for those

model <- fit_linear(x = x, y = y_known)
model

plot_linear(x = x, y = y_known)

interpolate_linear(y = y_unknown, model)

rm(x, y_known, y_unknown, model)




