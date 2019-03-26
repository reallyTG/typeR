library(coalitions)


### Name: scrape_wahlrecht
### Title: Scrape surveys from wahlrecht.de
### Aliases: scrape_wahlrecht scrape_by scrape_ltw

### ** Examples

library(coalitions)
library(dplyr)
# select a polling agency from .pollster_df that should be scraped ...
coalitions:::.pollster_df
# ... here we choose Forsa
address <- coalitions:::.pollster_df %>% filter(pollster == "forsa") %>% pull(address)
scrape_wahlrecht(address = address) %>% slice(1:5)
# Niedersachsen
scrape_ltw() %>% slice(1:5)
# Hessen
scrape_ltw("http://www.wahlrecht.de/umfragen/landtage/hessen.htm", ind_row_remove=-c(1)) %>%
 slice(1:5)



