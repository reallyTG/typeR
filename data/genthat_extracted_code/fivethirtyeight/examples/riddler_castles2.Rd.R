library(fivethirtyeight)


### Name: riddler_castles2
### Title: The Battle For Riddler Nation, Round 2
### Aliases: riddler_castles2
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run
library(tidyverse)
library(stringr)
riddler_castles_tidy<-riddler_castles2 %>%
   gather(key = castle , value = soldiers, castle1:castle10) %>%
   mutate(castle = as.numeric(str_replace(castle, "castle","")))



