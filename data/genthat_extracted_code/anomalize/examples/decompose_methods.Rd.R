library(anomalize)


### Name: decompose_methods
### Title: Methods that power time_decompose()
### Aliases: decompose_methods decompose_twitter decompose_stl

### ** Examples


library(dplyr)

tidyverse_cran_downloads %>%
    ungroup() %>%
    filter(package == "tidyquant") %>%
    decompose_stl(count)





