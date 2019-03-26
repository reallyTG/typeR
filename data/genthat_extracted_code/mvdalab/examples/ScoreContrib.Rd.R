library(mvdalab)


### Name: ScoreContrib
### Title: Generates a score contribution plot
### Aliases: ScoreContrib

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "none")
Score.Contributions1 <- ScoreContrib(mod1, ncomp = 1:2, obs1 = 1, obs2 = 3)
plot(Score.Contributions1, ncomp = 2)

## Not run: 
##D data(Penta)
##D mod2 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
##D                ncomp = 2, validation = "none")
##D Score.Contributions2 <- ScoreContrib(mod2, obs1 = 1, obs2 = 3)
##D plot(Score.Contributions2)
##D Score.Contributions3 <- ScoreContrib(mod1, obs1 = c(1, 3), obs2 = c(5:10))
##D plot(Score.Contributions3)
## End(Not run)

###  PLS MODEL FIT WITH method = 'wrtpls' and validation = 'none', i.e. WRT-PLS is performed ###
## Not run: 
##D mod3 <- plsFit(Sepal.Length ~., scale = TRUE, data = iris,
##D                method = "wrtpls", validation = "none") #ncomp is ignored
##D Score.Contributions4 <- ScoreContrib(mod3, ncomp = 1:5, obs1 = 1, obs2 = 3)
##D plot(Score.Contributions4, ncomp = 5)
## End(Not run)

#PCA Model
pc1 <- pcaFit(Penta[, -1], ncomp = 2)
Score.Contributions1 <- ScoreContrib(pc1, obs1 = 1, obs2 = 3)
plot(Score.Contributions1)



