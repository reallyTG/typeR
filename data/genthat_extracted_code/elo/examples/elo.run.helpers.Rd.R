library(elo)


### Name: elo.run.helpers
### Title: Helper functions for 'elo.run'
### Aliases: elo.run.helpers as.matrix.elo.run as.matrix.elo.run.regressed
###   as.data.frame.elo.run final.elos final.elos.elo.run
###   final.elos.elo.run.regressed

### ** Examples

e <- elo.run(score(points.Home, points.Visitor) ~ team.Home + team.Visitor + group(week),
             data = tournament, k = 20)
head(as.matrix(e))
str(as.data.frame(e))
final.elos(e)



