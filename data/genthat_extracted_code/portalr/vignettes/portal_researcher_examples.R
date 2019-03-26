## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning = FALSE, message = FALSE-----------------------------------
#devtools::install_github("weecology/portalr")
library(portalr)
library(tidyverse)  

## ---- warning = FALSE, message = FALSE-----------------------------------
biomass_data <- portalr::get_rodent_data(path = "repo", 
                                         level = "plot", 
                                         output = "biomass",
                                         time = "date")

## ---- echo = FALSE, results='asis'---------------------------------------
knitr::kable(tail(biomass_data[, 1:10]))

## ---- warning = FALSE, message = FALSE-----------------------------------
biomass_data <- biomass_data %>% 
  # split the date column into year, month, and day
  separate(col = censusdate, into = c("year", "month", "day"), sep = "-") %>% 
  filter(year >= 1988 & year < 2015,                         # filter by year
         treatment == "control" | treatment == "exclosure")  # filter by treatment type

## ---- warning = FALSE, message = FALSE-----------------------------------
# compute total biomass per year and treatment
biomass_total <- biomass_data %>%
  gather(species, biomass, BA:SO) %>%
  group_by(year, treatment) %>%
  summarize(totals = sum(biomass, na.rm = TRUE))

# make a column with the exclosure:control ratio
biomass_ratio <- biomass_total %>%
  spread(treatment, totals) %>%
  mutate(EX_to_CO_ratio = exclosure / control) %>%
  ungroup()

## ---- echo = FALSE, fig.width = 6, fig.height = 4------------------------
biomass_ratio$year <- as.numeric(biomass_ratio$year)
ggplot(biomass_ratio, aes(year, EX_to_CO_ratio)) +
  annotate(geom = "rect", fill = "grey", alpha = 0.4,
           xmin = 1995, xmax = 1998,
           ymin = -Inf, ymax = Inf) +
  annotate(geom = "rect", fill = "grey", alpha = 0.4,
           xmin = 2008, xmax = 2010,
           ymin = -Inf, ymax = Inf) +
  geom_point(size = 3) +
  geom_line() +
  ylab("Kangaroo Rat Exclosure:Control Biomass") +
  xlab("Year") + 
  theme_classic() +
  theme(panel.border = element_rect(fill = NA, colour = "black"),
        axis.title.x = element_text(face = "bold", size = 12, margin = margin(t = 20)),
        axis.title.y = element_text(face = "bold", size = 12, margin = margin(r = 20)),
        axis.text.x = element_text(face = "bold", size = 10),
        axis.text.y = element_text(face = "bold", size = 10))

## ---- warning = FALSE, message = FALSE-----------------------------------
plant_data <- portalr::get_plant_data(path = 'repo', level = 'plot',
                                      type = 'winter-annual', correct_sp = TRUE,
                                      unknowns = FALSE, shape = 'flat', 
                                      output = 'abundance')

## ---- echo = FALSE, results = 'asis'-------------------------------------
knitr::kable(head(plant_data))

## ---- warning = FALSE, message = FALSE-----------------------------------
plant_data_winter <- dplyr::filter(plant_data, season == 'winter')

## ---- echo = FALSE, results = 'asis'-------------------------------------
knitr::kable(head(plant_data_winter))

