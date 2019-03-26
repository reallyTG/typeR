## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.wide = TRUE----------------------------------------------------
library(refuge)
library(ggplot2)
library(usmap)
library(dplyr, warn.conflicts = FALSE)
library(magrittr)
library(viridis)
library(stringi)

all <- rfg_all_restrooms(accessible = TRUE, unisex = TRUE, 
                         verbose = TRUE, tidy = TRUE)

all <- all %>% filter(country == "US")

all$state <-  tolower(trimws(all$state))

all$state <- stri_replace_all_fixed(all$state, c("minnestoa", "californa"), 
                                    c("minnesota", "california"),
                                    vectorize_all = FALSE)

all$state <- case_when(all$state %in% tolower(state.name) ~ all$state,
                     all$state %in% c("washington dc", 
                                      "washington, district of columbia",
                                      "columbia", "DC",
                                      "washington district of columbia") ~
                       "District of Columbia", 
                     TRUE ~ tolower(state.name)[match(all$state, tolower(state.abb))])

all <- all %>% filter(!is.na(state)) %>%
  group_by(state) %>% 
  summarise(n_toilets=n())

p_toilets <- plot_usmap(data = all, values = "n_toilets") + 
  scale_fill_viridis(name = "Number of\nRestrooms", label = scales::comma) +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "")

p_toilets



