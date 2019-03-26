library(BradleyTerry2)


### Name: baseball
### Title: Baseball Data from Agresti (2002)
### Aliases: baseball
### Keywords: datasets

### ** Examples


##  This reproduces the analysis in Sec 10.6 of Agresti (2002).
data(baseball) # start with baseball data as provided by package

##  Simple Bradley-Terry model, ignoring home advantage:
baseballModel1 <- BTm(cbind(home.wins, away.wins), home.team, away.team,
                      data = baseball, id = "team")

##  Now incorporate the "home advantage" effect
baseball$home.team <- data.frame(team = baseball$home.team, at.home = 1)
baseball$away.team <- data.frame(team = baseball$away.team, at.home = 0)
baseballModel2 <- update(baseballModel1, formula = ~ team + at.home)

##  Compare the fit of these two models:
anova(baseballModel1, baseballModel2)





