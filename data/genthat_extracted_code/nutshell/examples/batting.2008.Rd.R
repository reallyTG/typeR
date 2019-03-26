library(nutshell)


### Name: batting.2008
### Title: MLB Batting Data, 2008 Season
### Aliases: batting.2008
### Keywords: datasets

### ** Examples

data(batting.2008)
  tapply(X=batting.2008$HR,INDEX=list(batting.2008$teamID),FUN=sum)



