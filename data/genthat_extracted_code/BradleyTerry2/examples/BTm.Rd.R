library(BradleyTerry2)


### Name: BTm
### Title: Bradley-Terry Model and Extensions
### Aliases: BTm
### Keywords: models

### ** Examples


########################################################
##  Statistics journal citation data from Stigler (1994)
##  -- see also Agresti (2002, p448)
########################################################

##  Convert frequencies to success/failure data
citations.sf <- countsToBinomial(citations)
names(citations.sf)[1:2] <- c("journal1", "journal2")

##  First fit the "standard" Bradley-Terry model
citeModel <- BTm(cbind(win1, win2), journal1, journal2, data = citations.sf)

##  Now the same thing with a different "reference" journal
citeModel2 <- update(citeModel, refcat = "JASA")
BTabilities(citeModel2)

##################################################################
##  Now an example with an order effect -- see Agresti (2002) p438
##################################################################
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

##
## For a more elaborate example with both player-level and contest-level
## predictor variables, see help(chameleons).
##




