library(dbplot)


### Name: dbplot_bar
### Title: Bar plot
### Aliases: dbplot_bar

### ** Examples


library(ggplot2)
library(dplyr)

# Returns a plot of the row count per am
mtcars %>%
  dbplot_bar(am)

# Returns a plot of the average mpg per am
mtcars %>%
  dbplot_bar(am, mean(mpg))

# Returns the average and sum of mpg per am
mtcars %>%
  dbplot_bar(am, avg_mpg = mean(mpg), sum_mpg = sum(mpg))




