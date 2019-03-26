library(statar)


### Name: fill_gap
### Title: Add rows corresponding to gaps in some variable
### Aliases: fill_gap

### ** Examples

library(dplyr)
library(lubridate)
df <- data_frame(
    id    = c(1, 1, 1, 2),
    datem  = as.monthly(mdy(c("04/03/1992", "01/04/1992", "03/15/1992", "05/11/1992"))),
    value = c(4.1, 4.5, 3.3, 3.2)
)
df %>% group_by(id) %>% fill_gap(datem)
df %>% group_by(id) %>% fill_gap(datem, full = TRUE)
df %>% group_by(id) %>% fill_gap(datem, roll = "nearest")
df %>% group_by(id) %>% fill_gap(datem, roll = "nearest", full = TRUE)



