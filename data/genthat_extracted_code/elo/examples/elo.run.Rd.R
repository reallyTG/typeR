library(elo)


### Name: elo.run
### Title: Calculate Elos for a series of matches
### Aliases: elo.run elo.run print.elo.run print.elo.run.regressed

### ** Examples

data(tournament)
elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor,
        data = tournament, k = 20)

# Create non-constant 'k'
elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor +
        k(20*log(abs(points.Home - points.Visitor) + 1)), data = tournament)

# Adjust Elo for, e.g., home-field advantage
elo.run(score(points.Home, points.Visitor) ~ adjust(team.Home, 30) + team.Visitor,
        data = tournament, k = 20)

tournament$home.field <- 30
elo.run(score(points.Home, points.Visitor) ~ adjust(team.Home, home.field) + team.Visitor,
        data = tournament, k = 20)

# Regress the Elos back toward 1500 at the end of the half-season
elo.run(score(points.Home, points.Visitor) ~ adjust(team.Home, 30) +
        team.Visitor + regress(half, 1500, 0.2), data = tournament, k = 20)




