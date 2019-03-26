library(AER)


### Name: SportsCards
### Title: Endowment Effect for Sports Cards
### Aliases: SportsCards
### Keywords: datasets

### ** Examples

data("SportsCards")
summary(SportsCards)

plot(trade ~ permonth, data = SportsCards,
  ylevels = 2:1, breaks = c(0, 5, 10, 20, 30, 70))
plot(trade ~ years, data = SportsCards,
  ylevels = 2:1, breaks = c(0, 5, 10, 20, 60))



