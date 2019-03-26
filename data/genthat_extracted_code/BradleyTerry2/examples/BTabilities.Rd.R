library(BradleyTerry2)


### Name: BTabilities
### Title: Estimated Abilities from a Bradley-Terry Model
### Aliases: BTabilities print.BTabilities coef.BTabilities
###   vcov.BTabilities
### Keywords: models

### ** Examples


### citations example

##  Convert frequencies to success/failure data
citations.sf <- countsToBinomial(citations)
names(citations.sf)[1:2] <- c("journal1", "journal2")

##  Fit the "standard" Bradley-Terry model
citeModel <- BTm(cbind(win1, win2), journal1, journal2, data = citations.sf)
BTabilities(citeModel)

### baseball example

data(baseball) # start with baseball data as provided by package

##  Fit mode with home advantage
baseball$home.team <- data.frame(team = baseball$home.team, at.home = 1)
baseball$away.team <- data.frame(team = baseball$away.team, at.home = 0)
baseballModel2 <- BTm(cbind(home.wins, away.wins), home.team, away.team,
                      formula = ~ team + at.home, id = "team",
                      data = baseball)
##  Estimate abilities for each team, relative to Baltimore, when
##  playing away from home:  
BTabilities(baseballModel2)




