library(baseballDBR)


### Name: WHIP
### Title: Pitching: Calculate Walks plus Hits per Innings Pitched
### Aliases: WHIP
### Keywords: Hits Innings Pitched WHIP Walks per plus

### ** Examples


data("Pitching2016")
head(Pitching2016)

Pitching2016$WHIP <- WHIP(Pitching2016)




