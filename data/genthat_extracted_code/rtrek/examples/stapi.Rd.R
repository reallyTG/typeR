library(rtrek)


### Name: stapi
### Title: Retrieve Star Trek data from STAPI
### Aliases: stapi

### ** Examples

library(dplyr)
if(has_internet()){
  stapi("character", page_count = TRUE) # check first
  stapi("character", page = 2) %>% select(1:2)
  Q <- stapi("character", uid = "CHMA0000025118")
  Q$episodes %>% select(uid, title, stardateFrom, stardateTo)
}



