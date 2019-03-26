library(Rfit)


### Name: bbsalaries
### Title: Baseball Salaries
### Aliases: bbsalaries
### Keywords: datasets

### ** Examples

data(bbsalaries)
summary(rfit(logSalary~logYears+aveWins+aveLosses+era+aveGames+aveInnings+aveSaves,data=bbsalaries))



