## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("railtrails")

## ----example-------------------------------------------------------------
railtrails <- railtrails::railtrails
railtrails

## ---- unnesting----------------------------------------------------------
library(tidyr)
d <- railtrails::railtrails
d <- d %>% unnest(raw_reviews)
d

## ---- eval = F-----------------------------------------------------------
#  library(dplyr)
#  library(forcats)
#  library(stringr)
#  
#  d <- d %>%
#      mutate(category = as.factor(category),
#             category = fct_recode(category, "Greenway/Non-RT" = "Canal"),
#             mean_review = ifelse(mean_review == 0, NA, mean_review))
#  
#  d <- mutate(d,
#               surface_rc = case_when(
#                   surface == "Asphalt" ~ "Paved",
#                   surface == "Asphalt, Concrete" ~ "Paved",
#                   surface == "Concrete" ~ "Paved",
#                   surface == "Asphalt, Boardwalk" ~ "Paved",
#                   str_detect(surface, "Stone") ~ "Crushed Stone",
#                   str_detect(surface, "Ballast") ~ "Crushed Stone",
#                   str_detect(surface, "Gravel") ~ "Crushed Stone",
#                   TRUE ~ "Other"
#               )
#  )
#  
#  d$surface_rc <- as.factor(d$surface_rc)
#  
#  d$surface_rc <- fct_relevel(d$surface_rc,
#                               "Crushed Stone")
#  
#  d

