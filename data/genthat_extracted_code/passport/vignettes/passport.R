## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "passport-"
)

## ----intro, message=FALSE------------------------------------------------
library(passport)
library(gapminder)
library(tidyverse)    # Works equally well in any grammar.
set.seed(47)

grep("Korea", unique(gapminder$country), value = TRUE)
grep("Yemen", unique(gapminder$country), value = TRUE)

## ----standardize-1-------------------------------------------------------
gap <- gapminder %>% 
    # standardize to ISO 3166 Alpha-2 code
    mutate(country_code = parse_country(country))

gap %>%
    select(country, country_code, year, lifeExp) %>%
    sample_n(10)

## ----standardize-2, eval=FALSE-------------------------------------------
#  parse_country(c("somewhere in Japan", "日本", "Japon", "जापान"), how = "google")
#  #> [1] "JP" "JP" "JP" "JP"
#  
#  parse_country(c("1600 Pennsylvania Ave, DC", "Eiffel Tower"), how = "google")
#  #> [1] "US" "FR"

## ----convert-1, message = FALSE------------------------------------------
# 2016 Olympic gold medal data
olympics <- read_tsv("https://raw.githubusercontent.com/nbremer/olympicfeathers/gh-pages/data/raw%20medal%20data/Rio%202016%20gold%20medal%20winners.txt")

olympics %>% count(country = as_country_code(NOC, from = "ioc"), sort = TRUE)

## ----convert-2-----------------------------------------------------------
olympics %>% 
    count(country = as_country_name(NOC, from = "ioc"), 
          Event_gender) %>% 
    spread(Event_gender, n) %>% 
    arrange(desc(W))

## ----convert-3-----------------------------------------------------------
olympics$NOC %>% unique() %>% 
    as_country_name(from = "ioc", to = "ta-my") %>% 
    head(10)

## ----format, fig.width=5-------------------------------------------------
living_longer <- gap %>% 
    group_by(country_code) %>% 
    summarise(start_life_exp = lifeExp[which.min(year)], 
              stop_life_exp = lifeExp[which.max(year)], 
              diff_life_exp = stop_life_exp - start_life_exp) %>% 
    top_n(10, diff_life_exp) 

# Plot country codes...
ggplot(living_longer, aes(x = country_code, y = stop_life_exp - 4.5,
                          ymin = start_life_exp, 
                          ymax = stop_life_exp - 4.5, 
                          colour = factor(diff_life_exp))) + 
    geom_point(pch = 17, size = 7) + 
    geom_linerange(size = 5) + 
                     # ...just pass `labels` a formatter function!
    scale_x_discrete(labels = country_format(),
                     # Easily change order
                     limits = order_countries(living_longer$country_code, 
                                              living_longer$diff_life_exp)) + 
    scale_y_continuous(limits = c(30, 80)) + 
    labs(title = "Life gets better",
         subtitle = "Largest increase in life expectancy",
         x = NULL, y = "Life expectancy") + 
    theme(axis.text.x = element_text(angle = 30, hjust = 1), 
          legend.position = "none")

