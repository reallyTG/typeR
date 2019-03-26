library(seplyr)


### Name: deselect
### Title: deselect standard interface.
### Aliases: deselect

### ** Examples



datasets::mtcars %.>%
   deselect(., c("cyl", "gear")) %.>%
   head(.)
# essentially dplyr::select( datasets::mtcars, -cyl, -gear)




