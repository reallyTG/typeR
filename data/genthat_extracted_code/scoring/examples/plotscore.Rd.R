library(scoring)


### Name: plotscore
### Title: Plot a Two-Alternative Scoring Rule
### Aliases: plotscore

### ** Examples

## Plot Brier score from power family with natural bounds
plotscore(c(2,.5), fam="pow")

## Plot Brier score from beta family with bounds of 0 and 1
plotscore(c(1,1), fam="beta", bounds=c(0,1))

## Plot log score
plotscore(c(0,0), fam="beta")

## Score from pseudospherical family with
## baseline of .3 and (0,1) bounds
plotscore(c(3, .3), fam="sph", bounds=c(0,1))



