library(ggparliament)


### Name: parliament_data
### Title: A function that prepares data for parliamentary plots
### Aliases: parliament_data

### ** Examples

data <- election_data[
  election_data$country == "USA" &
  election_data$house == "Representatives" &
  election_data$year == "2016",]
usa_data <- parliament_data(
  election_data = data,
  type = "semicircle",
  party_seats = data$seats,
  parl_rows = 8
)



