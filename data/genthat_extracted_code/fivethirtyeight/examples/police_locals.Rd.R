library(fivethirtyeight)


### Name: police_locals
### Title: Most Police Don't Live In The Cities They Serve
### Aliases: police_locals
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
police_locals_tidy <- police_locals %>%
   gather(key = "race", value = "perc_in", all:asian)



