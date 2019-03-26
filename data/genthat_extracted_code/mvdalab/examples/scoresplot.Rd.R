library(mvdalab)


### Name: scoresplot
### Title: 2D Graph of the scores
### Aliases: scoresplot

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
scoresplot(mod1, comp = c(1, 2))



