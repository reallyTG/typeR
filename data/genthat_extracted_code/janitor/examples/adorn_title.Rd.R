library(janitor)


### Name: adorn_title
### Title: Add column name to the top of a two-way tabyl.
### Aliases: adorn_title

### ** Examples


mtcars %>%
  tabyl(am, cyl) %>%
  adorn_title(placement = "top")

# Adding a title to a non-tabyl
library(tidyr); library(dplyr)
mtcars %>%
  group_by(gear, am) %>%
  summarise(avg_mpg = mean(mpg)) %>%
  spread(gear, avg_mpg) %>%
  adorn_title("top", row_name = "Gears", col_name = "Cylinders")



