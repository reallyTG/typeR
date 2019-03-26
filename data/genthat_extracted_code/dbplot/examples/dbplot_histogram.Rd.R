library(dbplot)


### Name: dbplot_histogram
### Title: Histogram
### Aliases: dbplot_histogram

### ** Examples


library(ggplot2)
library(dplyr)

# A ggplot histogram with 30 bins
mtcars %>%
  dbplot_histogram(mpg)

# A ggplot histogram with bins of size 10
mtcars %>%
  dbplot_histogram(mpg, binwidth = 10)




