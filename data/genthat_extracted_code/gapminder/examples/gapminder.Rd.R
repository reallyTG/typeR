library(gapminder)


### Name: gapminder
### Title: Gapminder data.
### Aliases: gapminder
### Keywords: datasets

### ** Examples

str(gapminder)
head(gapminder)
summary(gapminder)
table(gapminder$continent)
aggregate(lifeExp ~ continent, gapminder, median)
plot(lifeExp ~ year, gapminder, subset = country == "Cambodia", type = "b")
plot(lifeExp ~ gdpPercap, gapminder, subset = year == 2007, log = "x")

if (require("dplyr")) {
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(lifeExp = median(lifeExp))

# how many unique countries does the data contain, by continent?
gapminder %>%
  group_by(continent) %>%
  summarize(n_obs = n(), n_countries = n_distinct(country))

# by continent, which country experienced the sharpest 5-year drop in
# life expectancy and what was the drop?
gapminder %>%
  group_by(continent, country) %>%
  select(country, year, continent, lifeExp) %>%
  mutate(le_delta = lifeExp - lag(lifeExp)) %>%
  summarize(worst_le_delta = min(le_delta, na.rm = TRUE)) %>%
  filter(min_rank(worst_le_delta) < 2) %>%
  arrange(worst_le_delta)
}




