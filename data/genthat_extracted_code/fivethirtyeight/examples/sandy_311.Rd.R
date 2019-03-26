library(fivethirtyeight)


### Name: sandy_311
### Title: The (Very) Long Tail Of Hurricane Recovery
### Aliases: sandy_311
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
sandy_311_tidy <- sandy_311 %>%
  gather(agency, num_calls, -c("date", "total")) %>%
  arrange(date) %>%
  select(date, agency, num_calls, total) %>%
  rename(total_calls = total) %>%
  mutate(agency = as.factor(agency))



