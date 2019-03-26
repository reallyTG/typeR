library(tidytidbits)


### Name: execute_if
### Title: Conditional execution in a pipeline
### Aliases: execute_if execute_if_else

### ** Examples

library(magrittr)
library(dplyr)
library(tibble)
library(stringr)
convert_to_quartiles <- TRUE
tibble(score=c(1,2,3,4,1,2,3,4,2,3,2,3,4,3,3)) %>%
  mutate(do_something=1) %>%
  execute_if(convert_to_quartiles,
             mutate(score = cut(score, 4, labels = str_c("Quartile ", 1:4)))) %>%
  filter(score > 2)



