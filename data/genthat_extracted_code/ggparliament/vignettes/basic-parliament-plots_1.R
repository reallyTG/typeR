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
us_rep <- election_data %>%
    filter(country == "USA" &
               year == 2016 &
               house == "Representatives")
head(us_rep)

## ------------------------------------------------------------------------
us_house_semicircle <- parliament_data(election_data = us_rep,
                                       type = "semicircle",
                                       parl_rows = 10,
                                       party_seats = us_rep$seats)
head(us_house_semicircle)

## ---- fig.width=6, fig.height=4------------------------------------------
us <- ggplot(us_house_semicircle, aes(x = x, y = y, colour = party_short)) +
geom_parliament_seats() + 
theme_ggparliament() +
labs(colour = NULL, 
     title = "United States Congress") +
scale_colour_manual(values = us_house_semicircle$colour, 
                    limits = us_house_semicircle$party_short) 

us

## ------------------------------------------------------------------------
australia <- election_data %>%
    filter(country == "Australia" &
               house == "Representatives" &
               year == 2016) 

australia_horseshoe <- parliament_data(election_data = australia,
                                       party_seats = australia$seats,
                                       parl_rows = 4,
                                       type = "horseshoe")

## ----fig.width=4, fig.height=4-------------------------------------------
au <- ggplot(australia_horseshoe, aes(x, y, colour = party_short)) +
    geom_parliament_seats() + 
    theme_ggparliament() +
    labs(colour = NULL, 
         title = "Australian Parliament") +
    scale_colour_manual(values = australia$colour, 
                        limits = australia$party_short) + 
    theme(legend.position = 'bottom')

au

## ---- fig.height=6, fig.width = 6----------------------------------------
#get the data for the last election
uk_data <- election_data %>%
  filter(country == "UK") %>%
  filter(year == 2017) %>% #parliament_data() can be called in a dplyr chain.
  parliament_data(election_data = ., 
                  party_seats = .$seats,
                  #need to include grouping for opposing benches by definition
                  group = .$government,
                  parl_rows = 12,
                  type = "opposing_benches")

#plot it
uk <- ggplot(uk_data, aes(x, y, colour = party_short)) +
  scale_colour_manual(values = uk_data$colour, limits = uk_data$party_short) +
  geom_parliament_seats() +
  theme_ggparliament()

uk


## ------------------------------------------------------------------------
russia_classroom <- election_data %>%
  filter(country == "Russia" &
    house == "Duma" &
    year == 2016) %>% 
  parliament_data(election_data = .,
                  party_seats = .$seats,
                  parl_rows = 11,
                  type = "classroom")

## ----fig.width=4, fig.height=4-------------------------------------------
rus <- ggplot(russia_classroom, aes(x, y, colour = party_short)) +
  geom_parliament_seats() +
  theme_ggparliament() +
  labs(
    colour = NULL,
    title = "Russian Duma") +
  scale_colour_manual(
    values = russia_classroom$colour,
    limits = russia_classroom$party_short) +
  theme(legend.position = "bottom")

rus

## ------------------------------------------------------------------------
russia_circle <- election_data %>%
  filter(country == "Russia" &
    house == "Duma" &
    year == 2016) %>% 
  parliament_data(election_data = .,
    party_seats = .$seats,
    parl_rows = 11,
    type = "circle")

## ----fig.width=4, fig.height=4-------------------------------------------
russia_circle_example <- ggplot(russia_circle, aes(x, y, colour = party_short)) +
  geom_parliament_seats() +
  theme_ggparliament() +
  scale_colour_manual(
    values = russia_circle$colour,
    limits = russia_circle$party_short) +
  labs(colour = NULL) +
  theme(legend.position = "bottom")

russia_circle_example

## ------------------------------------------------------------------------
#a made up example of a vector of seats
seats <- c(rep("democrats", 40), rep("republicans", 30), rep("socialists", 20), rep("nationalists", 10))

made_up_layout <- parliament_data(election_data = NULL,
    party_seats = as.numeric(table(seats)),
    parl_rows = 4,
    type = "semicircle")

made_up_layout$party = seats

plot <- ggplot(made_up_layout, aes(x, y, colour = party)) +
    geom_parliament_seats() +
    theme_ggparliament() +
    labs(colour = NULL) +
    theme(legend.position = "bottom")

plot

## ------------------------------------------------------------------------
house_of_reps <- data.frame(
  party = c("Vacancies","Republicans", "Democrats", "Vacancies"),
  seats = c(3, 236, 193, 3),
  color = c("gray", "red", "blue", "gray")
) 
house_of_reps <- house_of_reps %>% 
  mutate(party = as.character(party), color = as.character(color)) %>%
  parliament_data(election_data = .,
                            parl_rows = 8,
                            party_seats = .$seats,
                            type = 'semicircle')
ggplot(data = house_of_reps) +
  geom_parliament_seats(aes(x = x,  y = y, color = party)) +
  theme_ggparliament() +
  scale_color_manual(values = house_of_reps$color, 
                     limits = house_of_reps$party)


