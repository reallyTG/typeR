library(dbplot)


### Name: db_bin
### Title: Bin formula
### Aliases: db_bin

### ** Examples


 library(dplyr)

  # Important: Always name the field and
  # prefix the function with `!!`` (See Details)

  # Uses the default 30 bins
  mtcars %>%
    group_by(x = !! db_bin(mpg)) %>%
    tally()

  # Uses binwidth which overrides bins
  mtcars %>%
    group_by(x = !! db_bin(mpg, binwidth = 10)) %>%
    tally()




