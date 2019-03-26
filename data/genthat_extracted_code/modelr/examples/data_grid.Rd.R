library(modelr)


### Name: data_grid
### Title: Generate a data grid.
### Aliases: data_grid

### ** Examples

data_grid(mtcars, vs, am)

# For continuous variables, seq_range is useful
data_grid(mtcars, mpg = seq_range(mpg, 10))

# If you optionally supply a model, missing predictors will
# be filled in with typical values
mod <- lm(mpg ~ wt + cyl + vs, data = mtcars)
data_grid(mtcars, .model = mod)
data_grid(mtcars, cyl = seq_range(cyl, 9), .model = mod)



