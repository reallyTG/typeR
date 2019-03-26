library(anomalize)


### Name: plot_anomaly_decomposition
### Title: Visualize the time series decomposition with anomalies shown
### Aliases: plot_anomaly_decomposition

### ** Examples


library(dplyr)
library(ggplot2)

data(tidyverse_cran_downloads)

tidyverse_cran_downloads %>%
    filter(package == "tidyquant") %>%
    ungroup() %>%
    time_decompose(count, method = "stl") %>%
    anomalize(remainder, method = "iqr") %>%
    plot_anomaly_decomposition()




