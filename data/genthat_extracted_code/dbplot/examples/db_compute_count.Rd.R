library(dbplot)


### Name: db_compute_count
### Title: Aggregates over a discrete field
### Aliases: db_compute_count

### ** Examples


library(dplyr)

# Returns the row count per am
mtcars %>%
  db_compute_count(am)

# Returns the average mpg per am
mtcars %>%
  db_compute_count(am, mean(mpg))
  
# Returns the average and sum of mpg per am
mtcars %>%
  db_compute_count(am, mean(mpg), sum(mpg))




