library(mRchmadness)


### Name: test.bracket
### Title: Test a bracket
### Aliases: test.bracket

### ** Examples

prob.matrix = bradley.terry(games = games.men.2017)
my.bracket = find.bracket(bracket.empty = bracket.men.2017,
  prob.matrix = prob.matrix, pool.source = "pop", league = "men",
  year = 2017)
result = test.bracket(bracket.empty = bracket.men.2017,
  bracket.picks = my.bracket, prob.matrix = prob.matrix,
  pool.source = "pop", league = "men", year = 2017)



