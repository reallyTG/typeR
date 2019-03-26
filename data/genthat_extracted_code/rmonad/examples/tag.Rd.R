library(rmonad)


### Name: tag
### Title: Set the tag of an Rmonad object
### Aliases: tag

### ** Examples

library(magrittr)
1 %>>% prod(2) %>% tag('a/b') %>>% prod(3) %>% get_tag




