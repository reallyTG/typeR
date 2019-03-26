library(dbplot)


### Name: db_compute_bins
### Title: Calculates a histogram bins
### Aliases: db_compute_bins

### ** Examples


library(dplyr)

# Returns record count for 30 bins in mpg
mtcars %>%
  db_compute_bins(mpg)

# Returns record count for bins of size 10
mtcars %>%
  db_compute_bins(mpg, binwidth = 10)




