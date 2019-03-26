library(scoring)


### Name: brierscore
### Title: Calculate Brier Scores And Decompositions
### Aliases: brierscore

### ** Examples

data("WorldEvents")
## Raw Brier scores
brier1 <- brierscore(answer ~ forecast, data=WorldEvents)
## Raw Brier scores plus group means and decompositions
brier2 <- brierscore(answer ~ forecast, data=WorldEvents,
                     group="forecaster", decomp=TRUE)
## Obtain Brier scores via calcscore
brier3 <- calcscore(answer ~ forecast, data=WorldEvents,
                    param=2, fam="pow")
all.equal(brier1, brier3)



