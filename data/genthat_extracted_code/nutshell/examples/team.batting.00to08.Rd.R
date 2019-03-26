library(nutshell)


### Name: team.batting.00to08
### Title: MLB Team Batting Statistics, 2000-2008
### Aliases: team.batting.00to08
### Keywords: datasets

### ** Examples

data(team.batting.00to08)
attach(team.batting.00to08)
runs.mdl <- lm(
  formula=runs~singles+doubles+triples+homeruns+
    walks+hitbypitch+sacrificeflies+
    stolenbases+caughtstealing,
  data=team.batting.00to08)
summary(runs.mdl)



