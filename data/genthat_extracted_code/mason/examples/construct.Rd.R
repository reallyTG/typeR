library(mason)


### Name: construct
### Title: Construct the results of the analysis
### Aliases: construct

### ** Examples


library(magrittr)
design(iris, 'cor') %>%
 add_settings() %>%
 add_variables('xvars', c('Sepal.Length', 'Sepal.Width')) %>%
 construct()

design(iris, 't.test') %>%
 add_settings() %>%
 add_variables('yvars', c('Sepal.Length', 'Sepal.Width')) %>%
 add_variables('xvars', c('Petal.Length', 'Petal.Width')) %>%
 construct()

design(iris, 'glm') %>%
 add_settings() %>%
 add_variables('yvars', c('Sepal.Length', 'Sepal.Width')) %>%
 add_variables('xvars', c('Petal.Length', 'Petal.Width')) %>%
 construct()

design(iris, 'gee') %>%
 add_settings('Species') %>%
 add_variables('yvars', c('Sepal.Length', 'Sepal.Width')) %>%
 add_variables('xvars', c('Petal.Length', 'Petal.Width')) %>%
 construct()




