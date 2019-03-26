library(vcd)


### Name: Bundesliga
### Title: Ergebnisse der Fussball-Bundesliga
### Aliases: Bundesliga
### Keywords: datasets

### ** Examples

data("Bundesliga")

## number of goals per game poisson distributed?
ngoals1 <- xtabs(~ HomeGoals, data = Bundesliga, subset = Year == 1995)
ngoals2 <- xtabs(~ AwayGoals, data = Bundesliga, subset = Year == 1995)
ngoals3 <- table(apply(subset(Bundesliga, Year == 1995)[,3:4], 1, sum))

gf1 <- goodfit(ngoals1)
gf2 <- goodfit(ngoals2)
gf3 <- goodfit(ngoals3)

summary(gf1)
summary(gf2)
summary(gf3)
plot(gf1)
plot(gf2)
plot(gf3)

Ord_plot(ngoals1)
distplot(ngoals1)



