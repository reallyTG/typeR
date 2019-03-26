library(modeldb)


### Name: simple_kmeans_db
### Title: Simple kmeans routine that works in-database
### Aliases: simple_kmeans_db

### ** Examples

library(dplyr)

x <- mtcars %>%
  simple_kmeans_db(mpg, qsec, wt)
  
x$centers




