library(anomalize)


### Name: prep_tbl_time
### Title: Automatically create tibbletime objects from tibbles
### Aliases: prep_tbl_time

### ** Examples


library(dplyr)
library(tibbletime)

data_tbl <- tibble(
    date  = seq.Date(from = as.Date("2018-01-01"), by = "day", length.out = 10),
    value = rnorm(10)
    )

prep_tbl_time(data_tbl)




