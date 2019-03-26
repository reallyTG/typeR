library(collateral)


### Name: tally
### Title: Get counts of types of mapped side effects.
### Aliases: tally tally_results tally_errors tally_warnings tally_messages
###   tally_output

### ** Examples


library(magrittr)

list("a", 10, 100) %>% map_safely(log) %>% tally_errors()
list(5, -12, 103) %>% map_quietly(log) %>% tally_warnings()

suppressMessages(library(tidyverse))

# if you're working with list-columns, the tally functions are useful
# in conjunction with dplyr::summarise()
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
  mutate(qlog = map_quietly(data, ~ log(.$wt))) %>%
  summarise(
    num_results = tally_results(qlog),
    num_warnings = tally_warnings(qlog))




