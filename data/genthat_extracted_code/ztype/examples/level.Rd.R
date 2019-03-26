library(ztype)


### Name: level
### Title: level
### Aliases: level

### ** Examples

require(ztype)
require(magrittr)
c("dplyr","ggplot2","lubridate") %>% gen_set_of_words() %>% level(10,50)



