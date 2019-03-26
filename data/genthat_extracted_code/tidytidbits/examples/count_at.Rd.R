library(tidytidbits)


### Name: count_at
### Title: Count by multiple variables
### Aliases: count_at

### ** Examples

library(magrittr)
library(datasets)
library(dplyr)
mtcars %>% count_at(vars(gear, cyl))



