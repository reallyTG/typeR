library(skimr)


### Name: wide
### Title: Working with 'skimr"s printed output
### Aliases: wide skim_to_wide skim_to_list

### ** Examples

# Treat the printed output as a wide data frame
skim_to_wide(iris)
iris %>% skim_to_wide()
iris %>%
  skim_to_wide() %>%
  dplyr::filter(type == "factor") %>% 
  dplyr::select(top_counts)

# Treat the printed output as a list of data frames
skim_to_list(iris)
iris %>% skim_to_list()

# Save the result
sl <- iris %>% skim_to_list() 
sl[["numeric"]]
kable(sl$numeric)

# Or grouped, this uses the magrittr exposition pipe
# see ?magrittr::`%$%`
library(magrittr)
iris %>%
  dplyr::group_by(Species) %>%
  skim_to_list() %$%
  kable(numeric)



