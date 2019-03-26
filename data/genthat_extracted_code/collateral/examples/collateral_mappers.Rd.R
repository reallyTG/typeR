library(collateral)


### Name: collateral_mappers
### Title: Map safely or quietly over a list.
### Aliases: collateral_mappers map_safely map_quietly map2_safely
###   map2_quietly pmap_safely pmap_quietly

### ** Examples


library(magrittr)

# like map(), these can be used to iterate over vectors or lists
list("a", 10, 100) %>% map_safely(log)
list(5, -12, 103) %>% map_quietly(log)

suppressMessages(library(tidyverse))

# if you're using tibbles, you can also iterate over list-columns,
# such as nested data frames
mtcars %>%
  rownames_to_column(var = "car") %>%
  as_data_frame() %>%
  select(car, cyl, disp, wt) %>%
  # spike some rows in cyl == 4 to make them fail
  mutate(wt = dplyr::case_when(
    wt < 2 ~ -wt,
    TRUE ~ wt)) %>%
  # nest and do some operations quietly()
  nest(-cyl) %>%
  mutate(qlog = map_quietly(data, ~ log(.$wt)))




