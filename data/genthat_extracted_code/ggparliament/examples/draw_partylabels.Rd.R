library(ggparliament)


### Name: draw_partylabels
### Title: Draw labels for political parties and seats per party
### Aliases: draw_partylabels

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
  draw_partylabels(
    type = "semicircle",
    party_names = party_long,
    party_seats = seats,
    party_colours = colour
  ) +
  ggplot2::scale_colour_manual(
    values = usa_data$colour,
    limits = usa_data$party_long)  +
  theme_ggparliament()



