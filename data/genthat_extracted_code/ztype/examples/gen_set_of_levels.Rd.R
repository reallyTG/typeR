library(ztype)


### Name: gen_set_of_levels
### Title: gen_set_of_levels
### Aliases: gen_set_of_levels

### ** Examples

require(ztype)
require(magrittr)
c("dplyr","ggplot2","lubridate") %>% gen_set_of_words() %>%
gen_set_of_levels(10) %>% cat()



