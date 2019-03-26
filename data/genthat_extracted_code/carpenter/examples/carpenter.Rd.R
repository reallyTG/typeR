library(carpenter)


### Name: carpenter
### Title: Build common tables for your research needs!
### Aliases: carpenter

### ** Examples


library(magrittr)
outline_table(iris, 'Species') %>%
 add_rows(c('Sepal.Length', 'Petal.Length'), stat_meanSD) %>%
 add_rows('Sepal.Width', stat_medianIQR) %>%
 renaming('rows', function(x) gsub('Sepal\\.', 'Sepal ', x)) %>%
 renaming('header', c('Measures', 'Setosa', 'Versicolor', 'Virginica')) %>%
 build_table(caption = 'A caption for the table')




