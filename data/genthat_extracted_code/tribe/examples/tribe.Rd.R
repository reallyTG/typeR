library(tribe)


### Name: tribe
### Title: Object attribute list
### Aliases: tribe tribe<- untribe

### ** Examples

library(lplyr)
A <- c(x = 1, y = 2, z = 3) %>% 
  at_mutate(package = "trib?")
A %>% 
  tribe(keep_obj = TRUE) %@>% 
  mutate(package = "tribe") %>% 
  untribe()




