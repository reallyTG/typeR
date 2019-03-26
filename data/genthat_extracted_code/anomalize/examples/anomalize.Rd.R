library(anomalize)


### Name: anomalize
### Title: Detect anomalies using the tidyverse
### Aliases: anomalize

### ** Examples


library(dplyr)

# Needed to pass CRAN check / This is loaded by default
set_time_scale_template(time_scale_template())

data(tidyverse_cran_downloads)

tidyverse_cran_downloads %>%
    time_decompose(count, method = "stl") %>%
    anomalize(remainder, method = "iqr")





