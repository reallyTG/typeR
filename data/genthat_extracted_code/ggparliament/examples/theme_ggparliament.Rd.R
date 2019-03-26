library(ggparliament)


### Name: theme_ggparliament
### Title: A theme for ggparliament
### Aliases: theme_ggparliament

### ** Examples

data <- election_data[
  election_data$country == "USA" &
  election_data$house == "Representatives" &
  election_data$year == "2016",
]
usa_data <- parliament_data(
  election_data = data,
  type = "semicircle",
  party_seats = data$seats,
  parl_rows = 8
)
ggplot2::ggplot(usa_data, ggplot2::aes(x, y, colour = party_long)) +
  geom_parliament_seats() +
  geom_highlight_government(government == 1) +
  theme_ggparliament(legend = TRUE, background_colour = TRUE, border = TRUE)



