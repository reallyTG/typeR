library(dbplot)


### Name: dbplot_line
### Title: Bar plot
### Aliases: dbplot_line

### ** Examples


library(ggplot2)
library(dplyr)

# Returns a plot of the row count per cyl
mtcars %>%
  dbplot_line(cyl)

# Returns a plot of the average mpg per cyl
mtcars %>%
  dbplot_line(cyl, mean(mpg))

# Returns the average and sum of mpg per am
mtcars %>%
  dbplot_line(am, avg_mpg = mean(mpg), sum_mpg = sum(mpg))




