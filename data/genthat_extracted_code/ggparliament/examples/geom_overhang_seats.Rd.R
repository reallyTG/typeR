library(ggparliament)


### Name: geom_overhang_seats
### Title: Draw overhang seats in mixed-member proportional (MMP) electoral
###   systems
### Aliases: geom_overhang_seats

### ** Examples

germany <- data.frame(
   year = 2013,
   seats = c(64, 63, 311, 193),
   government = c(0, 0, 1, 1),
   colour = c("#BE3075","#64A12D", "#000000","#EB001F"),
   party = c("The Left",
   "Alliance 90/The Greens",
   "Christian Democratic Union",
   "Social Democratic Party")
)
german_data <- parliament_data(
    election_data = germany,
    parl_rows = 11,
    party_seats = germany$seats,
    type = "semicircle"
)
german_data$overhang_seats <- rep(
    c(1, 0, 1, 0, 1, 0, 1, 0),
    c(16, 295, 11, 182, 3, 61, 3, 60)
)
ggplot2::ggplot(german_data, ggplot2::aes(x, y, colour = party)) +
 geom_parliament_seats() +
 geom_overhang_seats(overhang_seats == 1) +
 theme_ggparliament() +
 ggplot2::scale_colour_manual(values = as.character(german_data$colour),
 limits = as.character(german_data$party))



