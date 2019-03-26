library(anomalize)


### Name: time_decompose
### Title: Decompose a time series in preparation for anomaly detection
### Aliases: time_decompose

### ** Examples


library(dplyr)

data(tidyverse_cran_downloads)

# Basic Usage
tidyverse_cran_downloads %>%
    time_decompose(count, method = "stl")

# twitter
tidyverse_cran_downloads %>%
    time_decompose(count,
                   method       = "twitter",
                   frequency    = "1 week",
                   trend        = "2 months",
                   merge        = TRUE,
                   message      = FALSE)




