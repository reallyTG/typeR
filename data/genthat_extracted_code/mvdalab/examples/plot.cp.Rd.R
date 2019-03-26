library(mvdalab)


### Name: plot.cp
### Title: Plotting Function for Score Contributions.
### Aliases: plot.cp

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, method = "bidiagpls", validation = "loo")
Score.Contributions1 <- ScoreContrib(mod1, obs1 = 1, obs2 = 3)
plot(Score.Contributions1, ncomp = 1)

## Not run: 
##D data(Penta)
##D ## Number of bootstraps set to 300 to demonstrate flexibility
##D ## Use a minimum of 1000 (default) for results that support bootstraping
##D mod2 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
##D                ncomp = 2, validation = "oob", boots = 300)
##D Score.Contributions2 <- ScoreContrib(mod2, obs1 = 1, obs2 = 3)
##D plot(Score.Contributions2, ncomp = 1)
## End(Not run)

#PCA Model
pc1 <- pcaFit(Penta[, -1], ncomp = 3)
Score.Contributions1 <- ScoreContrib(mod1, obs1 = 1, obs2 = 3)
plot(Score.Contributions1, ncomp = 1)



