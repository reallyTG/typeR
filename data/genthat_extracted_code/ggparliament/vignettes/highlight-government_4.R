## ----setup, include=FALSE------------------------------------------------
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
us_congress <- election_data %>%
  filter(country == "USA" &
    year == 2016 &
    house == "Representatives")
head(us_congress)

## ------------------------------------------------------------------------
us_congress <- parliament_data(election_data = us_congress,
  type = "semicircle",
  parl_rows = 10,
  party_seats = us_congress$seats)
head(us_congress)

## ---- fig.width=6, fig.height=4------------------------------------------
us <- ggplot(us_congress, aes(x, y, colour = party_short)) +
  geom_parliament_seats() + 
  geom_highlight_government(government == 1) + #specify the variable you want to highlight here!
  theme_ggparliament() +
  labs(colour = NULL, 
       title = "United States Congress") +
  scale_colour_manual(values = us_congress$colour, 
                      limits = us_congress$party_short) 

us

## ------------------------------------------------------------------------
australia <- election_data %>%
  filter(country == "Australia" &
    house == "Representatives" &
    year == 2016) 

australia <- parliament_data(election_data = australia,
  party_seats = australia$seats,
  parl_rows = 4,
  type = "horseshoe")

## ----fig.width=4, fig.height=4-------------------------------------------
au <- ggplot(australia, aes(x, y, colour = party_short)) +
  geom_parliament_seats() + 
  geom_highlight_government(row == 1 & government == 1) + # this highlights the front bench.
  theme_ggparliament() +
  labs(colour = NULL, 
       title = "Australian Parliament") +
  scale_colour_manual(values = australia$colour, 
                      limits = australia$party_short) + 
  theme(legend.position = 'bottom') 

au

