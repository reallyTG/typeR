library(statar)


### Name: tlead-tlag
### Title: lead and lag with respect to a time variable
### Aliases: tlead-tlag tlead tlag

### ** Examples

date <- c(1989, 1991, 1992)
value <- c(4.1, 4.5, 3.3)
tlag(value, 1, time = date) #  returns value in year - 1
library(lubridate)
date <- as.monthly(mdy(c("01/04/1992", "03/15/1992", "04/03/1992")))
tlag(value, time = date) 
library(dplyr)
df <- data_frame(
   id    = c(1, 2, 2),
   date  = date,
   value = value
)
df %>% group_by(id) %>% mutate(valuel = tlag(value, n = 1, time = date))



