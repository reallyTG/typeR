## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

library("states")
library("dplyr")

## ------------------------------------------------------------------------

data("cowstates")
data("gwstates")


## ------------------------------------------------------------------------
table(cowstates$country_name %in% gwstates$country_name)

## ------------------------------------------------------------------------
table(gwstates$country_name %in% cowstates$country)

## ------------------------------------------------------------------------
cowstates %>% filter(!cowcode %in% gwstates$gwcode) %>%
  knitr::kable(caption = "Country codes in COW but not in G&W")

gwstates %>% filter(!gwcode %in% cowstates$cowcode) %>%
  knitr::kable(caption = "Country codes in G&W but not in COW")

