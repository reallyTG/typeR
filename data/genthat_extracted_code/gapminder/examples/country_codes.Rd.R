library(gapminder)


### Name: country_codes
### Title: Country codes
### Aliases: country_codes
### Keywords: datasets

### ** Examples

if (require("dplyr")) {
gapminder %>%
  filter(year == 2007, country %in% c("Kenya", "Peru", "Syria")) %>%
  select(country, continent) %>% 
  left_join(country_codes)
}



