library(ggparliament)


### Name: draw_majoritythreshold
### Title: Draw majority threshold
### Aliases: draw_majoritythreshold

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
  draw_majoritythreshold(
    n = 218,
    label = TRUE,
    type = 'semicircle'
  ) +
  theme_ggparliament()



