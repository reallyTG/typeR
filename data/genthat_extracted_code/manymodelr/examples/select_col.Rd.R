library(manymodelr)


### Name: select_col
### Title: A convenient selector gadget
### Aliases: select_col

### ** Examples

select_col(iris,Petal.Length,Sepal.Length,Species,Petal.Width)
# A pipe friendly example
## Not run: 
##D library(dplyr)
##D as_tibble(iris) %>%
##D select_col(Species)
## End(Not run)



