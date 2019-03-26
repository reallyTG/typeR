library(dplyr)


### Name: group_nest
### Title: Nest a tibble using a grouping specification
### Aliases: group_nest
### Keywords: internal

### ** Examples


#----- use case 1: a grouped data frame
iris %>%
  group_by(Species) %>%
  group_nest()

# this can be useful if the grouped data has been altered before nesting
iris %>%
  group_by(Species) %>%
  filter(Sepal.Length > mean(Sepal.Length)) %>%
  group_nest()

#----- use case 2: using group_nest() on a ungrouped data frame with
#                  a grouoping specification that uses the data mask
starwars %>%
  group_nest(species, homeworld)





