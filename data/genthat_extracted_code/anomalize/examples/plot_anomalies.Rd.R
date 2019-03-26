library(anomalize)


### Name: plot_anomalies
### Title: Visualize the anomalies in one or multiple time series
### Aliases: plot_anomalies

### ** Examples


library(dplyr)
library(ggplot2)

data(tidyverse_cran_downloads)

#### SINGLE TIME SERIES ####
tidyverse_cran_downloads %>%
    filter(package == "tidyquant") %>%
    ungroup() %>%
    time_decompose(count, method = "stl") %>%
    anomalize(remainder, method = "iqr") %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE)


#### MULTIPLE TIME SERIES ####
tidyverse_cran_downloads %>%
    time_decompose(count, method = "stl") %>%
    anomalize(remainder, method = "iqr") %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE, ncol = 3)




