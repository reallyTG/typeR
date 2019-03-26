library(anomalize)


### Name: time_frequency
### Title: Generate a time series frequency from a periodicity
### Aliases: time_frequency time_trend

### ** Examples


library(dplyr)

data(tidyverse_cran_downloads)

#### FREQUENCY DETECTION ####

# period = "auto"
tidyverse_cran_downloads %>%
    filter(package == "tidyquant") %>%
    ungroup() %>%
    time_frequency(period = "auto")

time_scale_template()

# period = "1 month"
tidyverse_cran_downloads %>%
    filter(package == "tidyquant") %>%
    ungroup() %>%
    time_frequency(period = "1 month")

#### TREND DETECTION ####

tidyverse_cran_downloads %>%
    filter(package == "tidyquant") %>%
    ungroup() %>%
    time_trend(period = "auto")



