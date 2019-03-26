library(ggparliament)


### Name: geom_parliament_seats
### Title: Parliament seats The parliament seats geom is used for plotting
###   data from parliament_data()
### Aliases: geom_parliament_seats

### ** Examples

data <- election_data[
  election_data$country == "USA" &
  election_data$house == "Representatives" &
  election_data$year == "2016",
]
usa_data <- parliament_data(
  election_data = data,
  type = "semicircle", party_seats = data$seats,
  parl_rows = 8
)
ggplot2::ggplot(usa_data, ggplot2::aes(x = x, y = y, colour = party_long)) +
  geom_parliament_seats() +
  theme_ggparliament()



