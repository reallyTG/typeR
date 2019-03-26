library(electoral)


### Name: seats_ha
### Title: Allocating Seats - Highest Averages
### Aliases: seats_ha

### ** Examples

seats_ha(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "dhondt")

seats_ha(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "webster")



