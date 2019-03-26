library(fivethirtyeight)


### Name: riddler_castles
### Title: Can You Rule Riddler Nation?
### Aliases: riddler_castles
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run
library(tidyverse)
library(stringr)
riddler_castles_tidy<-riddler_castles %>%
   gather(key = castle , value = soldiers, castle1:castle10) %>%
   mutate(castle = as.numeric(str_replace(castle, "castle","")))



