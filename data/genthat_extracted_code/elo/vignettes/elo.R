## ------------------------------------------------------------------------
library(elo)

## ------------------------------------------------------------------------
elo.A <- c(1500, 1500)
elo.B <- c(1500, 1600)
elo.prob(elo.A, elo.B)

## ------------------------------------------------------------------------
wins.A <- c(1, 0)
elo.update(wins.A, elo.A, elo.B, k = 20)

## ------------------------------------------------------------------------
elo.calc(wins.A, elo.A, elo.B, k = 20)

## ------------------------------------------------------------------------
data(tournament)
str(tournament)

## ------------------------------------------------------------------------
tournament$wins.A <- tournament$points.Home > tournament$points.Visitor
elo.run(wins.A ~ team.Home + team.Visitor, data = tournament, k = 20)
elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor, data = tournament, k = 20)

## ------------------------------------------------------------------------
elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor +
        k(20*log(abs(points.Home - points.Visitor) + 1)), data = tournament)

## ------------------------------------------------------------------------
elo.run(score(points.Home, points.Visitor) ~ adjust(team.Home, 10) + team.Visitor,
        data = tournament, k = 20)

## ------------------------------------------------------------------------
tournament$elo.Visitor <- 1500
elo.run(score(points.Home, points.Visitor) ~ team.Home + elo.Visitor,
        data = tournament, k = 20)

## ------------------------------------------------------------------------
tournament$elo.Visitor <- 1500
elo.run(score(points.Home, points.Visitor) ~ team.Home + elo.Visitor +
        regress(half, 1500, 0.2),
        data = tournament, k = 20)

## ------------------------------------------------------------------------
e <- elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor,
             data = tournament, k = 20)
summary(e)

## ------------------------------------------------------------------------
head(as.matrix(e))

## ------------------------------------------------------------------------
str(as.data.frame(e))

## ------------------------------------------------------------------------
final.elos(e)

## ------------------------------------------------------------------------
results <- elo.run(score(points.Home, points.Visitor) ~ adjust(team.Home, 10) + team.Visitor,
                   data = tournament, k = 20)
newdat <- data.frame(
  team.Home = "Athletic Armadillos",
  team.Visitor = "Blundering Baboons"
)
predict(results, newdata = newdat)

## ------------------------------------------------------------------------
dat <- data.frame(elo.A = c(1500, 1500), elo.B = c(1500, 1600),
                  wins.A = c(1, 0), k = 20)
form <- wins.A ~ elo.A + elo.B + k(k)
elo.prob(form, data = dat)
elo.update(form, data = dat)
elo.calc(form, data = dat)

## ------------------------------------------------------------------------
elo.prob(~ elo.A + elo.B, data = dat)

## ------------------------------------------------------------------------
elo.calc(wins.A ~ adjust(elo.A, 10) + elo.B + k(k), data = dat)

