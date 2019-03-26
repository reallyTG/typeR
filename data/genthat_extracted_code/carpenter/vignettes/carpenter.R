## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>"
)

## ------------------------------------------------------------------------
library(magrittr)
library(carpenter)
head(iris)
outline_table(iris, 'Species') 

## ------------------------------------------------------------------------
outline_table(iris, 'Species') %>% 
    add_rows('Sepal.Length', stat_meanSD) 

## ------------------------------------------------------------------------
outline_table(iris, 'Species') %>% 
    add_rows(c('Sepal.Length', 'Petal.Length'), stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR) 

## ------------------------------------------------------------------------
tab <- outline_table(iris, 'Species') %>% 
    add_rows(c('Sepal.Length', 'Petal.Length'), stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR)  %>% 
    renaming('header', c('Measures', 'Setosa', 'Versicolor', 'Virginica')) %>% 
    renaming('rows', function(x) gsub('\\.', ' ', x))
tab

## ------------------------------------------------------------------------
build_table(tab)

## ------------------------------------------------------------------------
library(dplyr, quietly = TRUE)
mtcars %>% 
    mutate(
        gear = as.factor(gear),
        vs = as.factor(vs)
    ) %>% 
    outline_table('vs') %>% 
    add_rows('mpg', stat_meanSD) %>%
    add_rows('drat', stat_medianIQR) %>% 
    add_rows('gear', stat_nPct) %>% 
    renaming('header', c('Measures', 'V-engine', 'Straight engine')) %>% 
    renaming('rows', function(x) x %>% 
                 gsub('drat', 'Read axle ratio', .) %>% 
                 gsub('mpg', 'Miles/gallon', .) %>% 
                 gsub('gear', 'Number of gears', .)) %>% 
    build_table()

## ------------------------------------------------------------------------
iris %>% 
    outline_table() %>% 
    add_rows('Sepal.Length', stat_meanSD) %>%
    add_rows('Sepal.Width', stat_medianIQR) %>% 
    renaming('header', c('Measures', 'Values')) %>% 
    build_table() 

## ---- eval=FALSE---------------------------------------------------------
#  iris %>%
#      outline_table() %>%
#      add_rows('Sepal.Length', stat_meanSD) %>%
#      add_rows('Sepal.Width', stat_medianIQR) %>%
#      renaming('header', c('Measures', 'Values')) %>%
#      build_table(finish = FALSE) %>%
#      write.csv('table1.csv', row.names = FALSE)

