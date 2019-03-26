## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ggparliament)
library(dplyr)
library(ggplot2)
require(tidyr)
require(magrittr)

source("../R/parliament_data.R")
source("../R/geom_parliament_seats.R")
source("../R/geom_highlight_government.R")
source("../R/helper_funcs.R")
source("../R/draw_majoritythreshold.R")
source("../R/draw_partylabels.R")
source("../R/draw_majoritythreshold.R")
source("../R/draw_totalseats.R")
source("../R/theme_ggparliament.R")
load("../R/sysdata.rda")

## ------------------------------------------------------------------------
unformatted_data <- election_data %>%
  filter(country == "Germany" & year == "2017") %>%
  arrange(party_long)
head(unformatted_data)

## ---- fig.width=6, fig.height=4------------------------------------------
formatted_data <- unformatted_data %>%
  arrange(-government, -seats)
formatted_parl_data <- formatted_data %>%
  parliament_data(.,
                  parl_rows = 12,
                  party_seats = .$seats,
                  type = "semicircle")
german_parliament <- ggplot(formatted_parl_data, aes(x, y, colour = party_short)) +
  geom_parliament_seats() +
  geom_highlight_government(government == 1) + 
  draw_majoritythreshold(n = 355, label = FALSE, type = "semicircle") + 
  labs(colour="Party", 
       title="Germany 2017 Election Results") + 
  theme_ggparliament() +
  scale_colour_manual(values = formatted_parl_data$colour, 
                      limits = formatted_parl_data$party_short)
german_parliament

## ---- fig.width=6, fig.height=4------------------------------------------
german_parliament <- unformatted_data %>%
  parliament_data(.,
                  parl_rows = 12,
                  party_seats = .$seats,
                  plot_order = .$seats,
                  type = "semicircle") %>%
  ggplot(., aes(x, y, colour = party_short)) +
  geom_parliament_seats() +
  geom_highlight_government(government == 1) + 
  draw_majoritythreshold(n = 355, label = FALSE, type = "semicircle") + 
  labs(colour="Party", 
       title="Germany 2017 Election Results Arranged by Seats per Party") + 
  theme_ggparliament() +
  scale_colour_manual(values = unformatted_data$colour, 
                      limits = unformatted_data$party_short)
german_parliament
  

## ---- fig.width=6, fig.height=4------------------------------------------
german_parliament <- unformatted_data %>%
  parliament_data(.,
                  parl_rows = 12,
                  party_seats = .$seats,
                  plot_order = .$seats * .$government,
                  type = "semicircle") %>%
  ggplot(., aes(x, y, colour = party_short)) +
  geom_parliament_seats() +
  geom_highlight_government(government == 1) + 
  draw_majoritythreshold(n = 355, label = FALSE, type = "semicircle") + 
  labs(colour="Party", 
       title="Germany 2017 Election Results Arranged by Seats per Party") + 
  theme_ggparliament() +
  scale_colour_manual(values = unformatted_data$colour, 
                      limits = unformatted_data$party_short)
german_parliament
  

