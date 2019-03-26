library(anomalize)


### Name: time_apply
### Title: Apply a function to a time series by period
### Aliases: time_apply

### ** Examples


library(dplyr)

data(tidyverse_cran_downloads)

# Basic Usage
tidyverse_cran_downloads %>%
    time_apply(count, period = "1 week", .fun = mean, na.rm = TRUE)




