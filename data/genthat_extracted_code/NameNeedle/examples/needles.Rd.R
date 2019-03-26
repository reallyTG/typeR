library(NameNeedle)


### Name: needles
### Title: Needleman-Wunsch global alignment algorithm
### Aliases: needles needleScores defaultNeedleParams
### Keywords: character

### ** Examples

data(cellLineNames)
myParam <- defaultNeedleParams
myParam$MATCH <- 2
myParam$MISMATCH <- -2
needles(sf2Names[2], illuNames[1], myParam)
scores <- needleScores(sf2Names[6], illuNames, myParam)
w <- which(scores == max(scores))
w
sf2Names[6]

needles(sf2Names[6], illuNames[w], myParam)



