## ---- include=FALSE------------------------------------------------------
library(magrittr)

## ------------------------------------------------------------------------
library(fishdata)
library(dplyr)
data("adult_morphologies")
data("juvenile_morphologies")
morphs <- bind_rows(adult_morphologies, juvenile_morphologies)

## ------------------------------------------------------------------------
data("adult_morphologies")
data("adult_growths")
adult_growths %>% 
  group_by(fish_id) %>% 
  summarise(age = max(increment)) %>% 
  right_join(adult_morphologies, by = "fish_id")

## ------------------------------------------------------------------------
data("juvenile_growths")
data("juvenile_morphologies")
juvenile_growths %>% 
  group_by(otolith_id) %>% 
  summarise(age = max(increment)) %>% 
  right_join(juvenile_morphologies, by = "otolith_id")

