library(dplyr)


### Name: tally
### Title: Count/tally observations by group
### Aliases: tally count add_tally add_count

### ** Examples

# tally() is short-hand for summarise()
mtcars %>% tally()
mtcars %>% group_by(cyl) %>% tally()
# count() is a short-hand for group_by() + tally()
mtcars %>% count(cyl)
# Note that if the data is already grouped, count() adds
# an additional group that is removed afterwards
mtcars %>% group_by(gear) %>% count(carb)

# add_tally() is short-hand for mutate()
mtcars %>% add_tally()
# add_count() is a short-hand for group_by() + add_tally()
mtcars %>% add_count(cyl)

# count() and tally() are designed so that you can call
# them repeatedly, each time rolling up a level of detail
species <-
 starwars %>%
 count(species, homeworld, sort = TRUE)
species
species %>% count(species, sort = TRUE)

# Change the name of the newly created column:
species <-
 starwars %>%
 count(species, homeworld, sort = TRUE, name = "n_species_by_homeworld")
species
species %>%
 count(species, sort = TRUE, name = "n_species")

# add_count() is useful for groupwise filtering
# e.g.: show details for species that have a single member
starwars %>%
  add_count(species) %>%
  filter(n == 1)



