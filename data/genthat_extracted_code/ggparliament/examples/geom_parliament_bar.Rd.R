library(ggparliament)


### Name: geom_parliament_bar
### Title: Add a bar showing proportion of seats by party in parliament
### Aliases: geom_parliament_bar

### ** Examples

data <- election_data[election_data$country == "USA" &
election_data$house == "Representatives" &
election_data$year == "2016",]
usa_data <- parliament_data(election_data = data,
type = "semicircle",
party_seats = data$seats,
parl_rows = 8)
ggplot2::ggplot(usa_data, ggplot2::aes(x, y, colour = party_long)) +
geom_parliament_seats() +
geom_parliament_bar(colour, party_long) +
ggplot2::scale_colour_manual(values = usa_data$colour, limits = usa_data$party_long)  +
theme_ggparliament()



