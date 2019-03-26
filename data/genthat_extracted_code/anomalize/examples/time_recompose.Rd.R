library(anomalize)


### Name: time_recompose
### Title: Recompose bands separating anomalies from "normal" observations
### Aliases: time_recompose

### ** Examples


library(dplyr)

data(tidyverse_cran_downloads)

# Basic Usage
tidyverse_cran_downloads %>%
    time_decompose(count, method = "stl") %>%
    anomalize(remainder, method = "iqr") %>%
    time_recompose()





