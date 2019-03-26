library(elo)


### Name: predict.elo.run
### Title: Make Predictions on an 'elo.run' Object
### Aliases: predict.elo.run predict.elo.run predict.elo.run.regressed

### ** Examples

data(tournament)
t1 <- head(tournament, -3)
t2 <- tail(tournament, 3)
results <- elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor,
                   data = t1, k = 20)
predict(results)
predict(results, newdata = t2)



