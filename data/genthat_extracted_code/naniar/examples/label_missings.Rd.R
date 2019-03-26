library(naniar)


### Name: label_missings
### Title: Is there a missing value in the row of a dataframe?
### Aliases: label_missings

### ** Examples


label_missings(airquality)

library(dplyr)

airquality %>%
  mutate(is_missing = label_missings(airquality)) %>%
  head()

airquality %>%
  mutate(is_missing = label_missings(airquality,
                                     missing = "definitely missing",
                                     complete = "absolutely complete")) %>%
  head()




