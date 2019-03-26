library(mason)


### Name: add_variables
### Title: Add variables to the analysis
### Aliases: add_variables

### ** Examples


library(magrittr)
ds <- design(iris, 'cor') %>%
 add_settings()
add_variables(ds, 'xvar', 'Sepal.Length')
add_variables(ds, 'yvar', 'Petal.Length')

ds <- design(iris, 't.test')
ds <- add_variables(ds, 'yvar', c('Sepal.Length', 'Sepal.Width'))
ds <- add_variables(ds, 'xvar', 'Petal.Length')




