library(ltm)


### Name: plot fscores
### Title: Factor Scores - Ability Estimates Plot method
### Aliases: plot.fscores
### Keywords: methods

### ** Examples


## Factor Scores for LSAT data:
fsc <- factor.scores(rasch(LSAT))
plot(fsc, include.items = TRUE, main = "KDE for Person Parameters")
legend("left", "item parameters", pch = 16, cex = 1.5, bty = "n")




