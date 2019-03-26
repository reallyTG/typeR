library(lplyr)


### Name: pull
### Title: Column selection
### Aliases: pull pull_ pull_.data.frame pull_.matrix pull_.list

### ** Examples

library(dplyr)
mtcars[["mpg"]]
mtcars %>% pull(mpg)

# more convenient than (mtcars %>% filter(mpg > 20))[[3L]]
mtcars %>%
  filter(mpg > 20) %>%
  pull(3)




