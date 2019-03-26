library(radiant.data)


### Name: combine_data
### Title: Combine datasets using dplyr's bind and join functions
### Aliases: combine_data

### ** Examples

avengers %>% combine_data(superheroes, type = "bind_cols")
combine_data(avengers, superheroes, type = "bind_cols")
avengers %>% combine_data(superheroes, type = "bind_rows")
avengers %>% combine_data(superheroes, add = "publisher", type = "bind_rows")




